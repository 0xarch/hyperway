//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

import "components"
import "services"

Scope {
  id: root

  Variants {
    model: Quickshell.screens;
    
    PanelWindow {
      required property var modelData

      screen: modelData

      anchors {
        top: true;
        left: true;
        right: true;
      }

      implicitHeight: 32;

      RowLayout {
        id: shell_root;

        property real margin: 5;
        
        anchors {
          verticalCenter: parent.verticalCenter;
        }

        RowLayout {
          id: bar_left;

          Layout.alignment: Qt.AlignHCenter | Qt.AlignLeft;

          Workspace {}
          // workspace
          //
          // current window
          //
          
        }

        RowLayout {
          id: bar_right;

          Layout.alignment: Qt.AlignHCenter | Qt.AlignRight;
          
          //
          // light-dark mode
          //
          // sep
          //
          // audio-input
          //
          // audio-output
          //
          // backlight
          //
          // sep
          //
          // wifi
          //
          // sep
          //
          // cpu
          //
          // mem+swap
          //
          // sep
          //
            //
            // keyboard-state
            //
            // battery
            //
          // sep
            // clock
          Clock { }
          //
          // tray
        }
      }
    }
  }
}
