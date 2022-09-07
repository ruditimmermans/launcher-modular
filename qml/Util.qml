import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import "pages"
import Terminalaccess 1.0
import Ubuntu.Components.Popups 0.1
import LauncherModular 1.0

Page {
    id: pageSettings

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Utilities");
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
    id:mainsettings
        anchors.fill: parent
        color: "#111111"
        anchors.topMargin: units.gu(6)


    Flickable {
        id: flickableSettings
        anchors.fill: parent
        contentHeight: settingsColumn.height
        flickableDirection: Flickable.VerticalFlick
        clip: true


        Column {
            id: settingsColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            spacing: units.gu(2)
            
            ListItem.Header {
                text: "<font color=\"#ffffff\">"+i18n.tr("Android apps")+"</font>"
            }
            
        Text{
            id: pleaseWaydroid
            width: parent.width
            text: i18n.tr('<b>Use this only when you have hidden Android applications using "WayDroid Helper" and want them to appear in "Launcher Modular"</b>')
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: i18n.tr('Show again hided Android apps in Launcher Modular')
            color: UbuntuColors.red
            onClicked: Terminalaccess.run("sudo -S bash file:///" + applicationDirPath + "assets/systemscript/repair.sh")
            }
      }
      
            Text{
            id: doubleWaydroid
            width: parent.width
            text: i18n.tr('<b>Removes the double icon from WayDroid into "Launcher Modular"</b>')
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 40
            anchors.bottomMargin: 40
            color: "white"
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 160
            anchors.bottomMargin: 160
            text: i18n.tr('Hide double WayDroid icon in Launcher Modular')
            color: UbuntuColors.red
            onClicked: Terminalaccess.run("sudo -S bash file:///" + applicationDirPath + "assets/systemscript/doubleicon.sh")
        }
    } // column
  } //flickable
} //rectangle settings