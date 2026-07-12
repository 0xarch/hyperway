#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <errno.h>
#include <stdbool.h>

// ========== EVENTS ==========
static const char *watch_events[] = {
    "workspacev2",
    "closewindow",
    "activewindowv2",
    // other events
    NULL
};
// ==============================

static int connect_socket(const char *path) {
    int sock = socket(AF_UNIX, SOCK_STREAM, 0);
    if (sock < 0) return -1;

    struct sockaddr_un addr = { .sun_family = AF_UNIX };
    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", path);

    if (connect(sock, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        close(sock);
        return -1;
    }
    return sock;
}

static bool match_event(const char *line) {
    for (const char **ev = watch_events; *ev; ev++) {
        if (strncmp(line, *ev, strlen(*ev)) == 0)
            return true;
    }
    return false;
}

static void waybar_ws(const char *line) {
    mkdir("/tmp/hyperway", 0755);

    FILE *cmd = popen(
        "hyprctl clients -j | jq -cr 'group_by(.workspace.id) | map({ id: .[0].workspace.id, classes: map(.class) }) | map([.id] + .classes[0:3]) | .[]? | join(\" \")'",
        // "hyprctl clients -j | jq -cr 'unique_by(.workspace.id) | .[]? | (.workspace.id | tostring)+\" \"+.class'",
        "r"
    );
    if (cmd) {
        FILE *out = fopen("/tmp/hyperway/workspace_state", "w");
        if (out) {
            char buf[1024];
            while (fgets(buf, sizeof(buf), cmd) != NULL) {
                fputs(buf, out);
            }
            fclose(out);
        }
        pclose(cmd);
    }
    system("pkill -SIGRTMIN+29 waybar 2>/dev/null");
}

int main(void) {
    const char *runtime = getenv("XDG_RUNTIME_DIR");
    const char *instance = getenv("HYPRLAND_INSTANCE_SIGNATURE");
    if (!runtime || !instance) {
        fprintf(stderr, "Missing XDG_RUNTIME_DIR or HYPRLAND_INSTANCE_SIGNATURE\n");
        return 1;
    }

    char sock_path[512];
    snprintf(sock_path, sizeof(sock_path), "%s/hypr/%s/.socket2.sock",
             runtime, instance);

    int sock = connect_socket(sock_path);
    if (sock < 0) {
        perror("connect socket");
        return 1;
    }

    FILE *fp = fdopen(sock, "r");
    if (!fp) {
        perror("fdopen");
        close(sock);
        return 1;
    }

    char *line = NULL;
    size_t len = 0;
    ssize_t nread;

    while ((nread = getline(&line, &len, fp)) != -1) {
        if (nread > 0 && line[nread-1] == '\n')
            line[nread-1] = '\0';

        if (match_event(line)) {
            waybar_ws(line);
        }
    }

    free(line);
    fclose(fp);
    return 0;
}
