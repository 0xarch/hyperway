#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  const char* name;
  const char* icon;
} IconRef;

IconRef icon_map[] = {
  {"kitty", "󰆍"},
  {"chromium", ""},
  {"Chromium", ""},
  {"QQ", "󰘅"},
  {"neovide", ""},
  {"code", "󰨞"},
  {"libreoffice-calc", ""},
  {"libreoffice-writer", ""},
  {"libreoffice-impress", ""},
  {"magicavoxel.exe", "MaV"},
  {"finalalert2yr.dat", "FA2"},
  {"com.obsproject.Studio", "OBS"},
  {"steam_app_default", "󰊖"},
  {"gamescope", "󰊖"},
  {"chrome-music.163.com__st_webplayer_-Default", "󰫔"},
  {"chrome-typhoon.nmc.cn__web.html-Default", "󰢘"},
  {"chrome-chat.deepseek.com__-Default", "󱜹"},
  {"org.kde.dolphin", "󰉋"},
  {"org.kde.kdenlive", ""},
  {"org.kde.krita", ""},
};

const char* DEFAULT_ICON = "󰖯";

const char* find_icon(const char* value) {
    for (int i = 0; i < sizeof(icon_map) / sizeof(IconRef); i++) {
        if (strcmp(value, icon_map[i].name) == 0) {
            return icon_map[i].icon;
        }
    }

    return DEFAULT_ICON;
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

  char classes[3][256] = {{0}};
  int count = 0;
  FILE *state = fopen("/tmp/hyperway/workspace_state", "r");
  if (state) {
    char line[512];
    while (fgets(line, sizeof(line), state)) {
      int id;
      char c1[256] = {0}, c2[256] = {0}, c3[256] = {0};
      int items = sscanf(line, "%d %255s %255s %255s", &id, c1, c2, c3);
      if (items >= 2 && id == index) {
        count = items - 1;
        strcpy(classes[0], c1);
        if (count >= 2) strcpy(classes[1], c2);
        if (count >= 3) strcpy(classes[2], c3);
        break;
      }
    }
    fclose(state);
  }

  if (count == 0) {
    char char_a[256] = {0}, char_b[256] = {0}, char_c[256] = {0};
    if (index == active) {
      snprintf(char_a, sizeof(char_a), "<span color='#00ff00'>[");
      snprintf(char_c, sizeof(char_c), "]</span>");
    } else {
      snprintf(char_a, sizeof(char_a), "<span color='#aaaaaa'> ");
      snprintf(char_c, sizeof(char_c), "</span> ");
    }
    snprintf(char_b, sizeof(char_b), "%d", index);
    printf("<span>%s%s%s</span>", char_a, char_b, char_c);
    return 0;
  }

  int three_icon_idx = -1;
  const char* three_icon = NULL;
  for (int i = 0; i < count; i++) {
    const char* icon = find_icon(classes[i]);
    if (icon) {
      size_t len = strlen(icon);
      if (len == 3 &&
          icon[0] >= 0x20 && icon[0] <= 0x7E &&
          icon[1] >= 0x20 && icon[1] <= 0x7E &&
          icon[2] >= 0x20 && icon[2] <= 0x7E) {
        three_icon_idx = i;
        three_icon = icon;
        break;
      }
    }
  }

  if (three_icon_idx != -1) {
    const char *text = three_icon;
    const char *color = (index == active) ? "#44ff44" : "#eeeeee";
    char output[512];
    if (index == 10) {
      snprintf(output, sizeof(output), "<span color='%s'>%s </span>", color, text);
    } else {
      snprintf(output, sizeof(output), "<span color='%s'>%s</span>", color, text);
    }
    printf("%s", output);
    return 0;
  }

  const char *icons[3];
  for (int i = 0; i < count; i++) {
    const char *icon = find_icon(classes[i]);
    if (icon == NULL) icon = classes[i];
    icons[i] = icon;
  }

  const char *colors[3];
  if (index == active) {
    colors[0] = "#00ff00";
    colors[1] = "#00aa44";
    colors[2] = "#008888";
  } else {
    colors[0] = "#eeeeee";
    colors[1] = "#aaaaaa";
    colors[2] = "#777777";
  }
  char inner[1024] = "";

  if (count == 1) {
    snprintf(inner, sizeof(inner),
      "<span color='%s'>%s</span> ",
      colors[0], icons[0]);
  } else if (count == 2) {
    snprintf(inner, sizeof(inner),
      "<span color='%s'>%s</span> <span color='%s'>%s</span> ",
      colors[0], icons[0], colors[1], icons[1]);
  } else if (count == 3) {
    snprintf(inner, sizeof(inner),
      "<span color='%s'>%s</span> <span color='%s'>%s</span> <span color='%s'>%s</span>",
      colors[0], icons[0], colors[1], icons[1], colors[2], icons[2]);
  }

  if (index == 10) {
    strcat(inner, " ");
  }

  printf("<span>%s</span>", inner);
  return 0;
}

