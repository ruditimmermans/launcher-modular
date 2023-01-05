import QtQuick 2.4
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
    
Page {
    id: pageSettingsTodo

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings Page");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        pageStack.pop();
                    }
                }
            ]
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
            anchors.fill: parent







        } // column
    } //flickable
 } //rectangle settings



}
