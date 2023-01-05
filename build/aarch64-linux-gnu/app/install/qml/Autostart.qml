import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls 2.2
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import "pages"

Page {
    id: pageAbout

    header: PageHeader {
        id: aboutPage
        title: i18n.tr("Autostart Launcher Modular");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions:
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        pageStack.pop();
        }
     }
  }

    Rectangle {
        id:rect1
        color: "#111111"
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

Item {
      width: parent.width
      height: parent.height

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }

        ListItem.Header {
                text: "<font color=\"#ffffff\">"+i18n.tr("How to Autostart Launcher Modular on boot")+"</font>"
        }

        Item {
            width: parent.width
            height: units.gu(2)
        }

        Item {
            width: parent.width
            height: autostartLabel.height + units.gu(2)
            Label {
                id: autostartLabel
                                text: i18n.tr("How to enable Launcher Modular to start automatically when the device is booted. <br><br>For more details see the <a href='https://github.com/ruditimmermans/launcher-modular-service'>how to add a Launcher Modular systemd user service file to/on your device</a>")
                onLinkActivated: Qt.openUrlExternally(link)
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }
        }
      }
    }
// AUTOSTART PAGE
}
