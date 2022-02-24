import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

    
Page {
    id: widgetSettingsEvent

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings Widget");
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
            spacing: units.gu(2)
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                    topMargin: units.gu(2)
            }




            Item {
                id: templateRow
                width: parent.width
                anchors {
                    left: parent.left
                    right: parent.right
                    rightMargin: units.gu(2)
                    leftMargin: units.gu(2)
                }
                height: units.gu(4)

                Label {
                    id: label
                    text: i18n.tr("Limit of days")
                    color:  "white"
                    width: templateRow.titleWidth
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    elide: Text.ElideRight
                    font.weight: Font.Light
                }

                Row {
                    id: contentRow
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: label.right
                    anchors.leftMargin: units.gu(2)
                    anchors.right: parent.right
                    spacing: units.gu(2)

                        TextField {
                            objectName: "textfield_standard"
                            placeholderText: i18n.tr("By default 60 days")
                            width: parent.width
                            text: launchermodular.settings.limiteDaysWidgetEvent
                            onTextChanged: { launchermodular.settings.limiteDaysWidgetEvent = text }
                            inputMethodHints: Qt.ImhDigitsOnly;
                        }
                }
            }

    

            Item {
                id: templateRow2
                width: parent.width
                anchors {
                    left: parent.left
                    right: parent.right
                    rightMargin: units.gu(2)
                    leftMargin: units.gu(2)
                    topMargin: units.gu(2)
                }
                height: units.gu(4)

                Label {
                    id: label2
                    text: i18n.tr("Limit of event")
                    color:  "white"
                    width: templateRow2.titleWidth
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    elide: Text.ElideRight
                    font.weight: Font.Light
                }

                Row {
                    id: contentRow2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: label2.right
                    anchors.leftMargin: units.gu(2)
                    anchors.right: parent.right
                    spacing: units.gu(2)

                        TextField {
                            objectName: "textfield_standard"
                            placeholderText: i18n.tr("By default 3 event")
                            width: parent.width
                            text: launchermodular.settings.limiteItemWidgetEvent
                            onTextChanged: { launchermodular.settings.limiteItemWidgetEvent = text }
                            inputMethodHints: Qt.ImhDigitsOnly;
                        }
                }
            }
            

        } // column
    } //flickable
 } //rectangle settings

}
