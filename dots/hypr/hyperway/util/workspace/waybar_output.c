#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  const char* name;
  const char* icon;
} IconRef;

IconRef icon_map[] = {
  {"kitty", " 󰆍 "},
  {"chromium", "  "},
  {"QQ", " 󰘅 "},
  {"neovide", "  "},
  {"magicavoxel.exe", "MaV"},
  {"finalalert2yr.dat", "FA2"},
  {"code", " 󰨞 "},
  {"org.kde.dolphin", " 󰉋 "},
  {"org.kde.kdenlive", "  "},
  {"org.kde.krita", "  "},
  {"com.obsproject.Studio", "OBS"}
};

const char* find_icon(const char* value) {
    for (int i = 0; i < sizeof(icon_map) / sizeof(IconRef); i++) {
        if (strcmp(value, icon_map[i].name) == 0) {
            return icon_map[i].icon;
        }
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return 0;
    }
    int index = atoi(argv[1]);

    FILE *fp = popen("hyprctl activeworkspace -j | jq -cr .id", "r");
    if (!fp) {
        return 0;
    }
    char active_str[32];
    if (fgets(active_str, sizeof(active_str), fp) == NULL) {
        pclose(fp);
        return 0;
    }
    pclose(fp);
    active_str[strcspn(active_str, "\n")] = '\0';
    int active = atoi(active_str);

    char value[256] = {0};
    FILE *state = fopen("/tmp/hyperway/workspace_state", "r");
    if (state) {
        char line[512];
        while (fgets(line, sizeof(line), state)) {
            int id;
            char name[256];
            if (sscanf(line, "%d %255s", &id, name) == 2) {
                if (id == index) {
                    strcpy(value, name);
                    break;
                }
            }
        }
        fclose(state);
    }

    char char_a[256] = {0};
    char char_b[256] = {0};
    char char_c[256] = {0};

    if (strlen(value) > 0) {
        if (index == active) {
            snprintf(char_a, sizeof(char_a), "<span color='#44ff44'>");
        } else {
            snprintf(char_a, sizeof(char_a), "<span color='#eeeeee'>");
        }

        const char* icon = find_icon(value);
        

        if (icon) {
            snprintf(char_b, sizeof(char_b), "%s", icon);
        } else {
            char tmp[4];
            snprintf(tmp, sizeof(tmp), "%3.3s", value);
            snprintf(char_b, sizeof(char_b), "%s", tmp);
        }

        snprintf(char_c, sizeof(char_c), index == 10 ? " </span>" : "</span>");
    } else {
        if (index == active) {
            snprintf(char_a, sizeof(char_a), "<span color='#00ff00'>[");
            if (index == 10) {
                snprintf(char_c, sizeof(char_c), "]</span>");
            } else {
                snprintf(char_c, sizeof(char_c), "]</span>");
            }
        } else {
            snprintf(char_a, sizeof(char_a), "<span color='#aaaaaa'> ");
            //if (index == 10) {
            snprintf(char_c, sizeof(char_c), "</span> ");
            //} else {
            //    snprintf(char_c, sizeof(char_c), "</span> ");
            //}
        }
        snprintf(char_b, sizeof(char_b), "%d", index);
    }

    printf("<span>%s%s%s</span>", char_a, char_b, char_c);
    return 0;
}
