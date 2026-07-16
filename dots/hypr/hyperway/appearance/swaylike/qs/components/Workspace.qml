import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
  id: root;

  property string workspace_count: Quickshell.env("HYPERWAY_WORKSPACE_COUNT");

  Text {
    text: root.workspace_count;
  }
}
