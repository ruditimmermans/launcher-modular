import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
    
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


            ListItem.Header {
                text: "<font color=\"#ffffff\">"+i18n.tr("Generals")+"</font>"
            }
            
            property var model: [
            { title: "<font color=\"#ffffff\">"+i18n.tr("Dialer")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Open the dialer")+"</font>", style:"tel" },
            { title: "<font color=\"#ffffff\">"+i18n.tr("Linphone")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Open Linphone")+"</font>", style:"linphone" }
            ]

            ListItem.ItemSelector {
                id: actionWidgetList
                width: (parent.width-textactionWidgets.width)-units.gu(6)
                anchors.right: parent.right
                anchors.rightMargin: units.gu(2)
                anchors.topMargin: units.gu(2)
                model: settingsColumn.model
                delegate: OptionSelectorDelegate {
                            property var item: model.modelData ? model.modelData : model
                            text: item.title
                            subText: item.descr
                        }
                onSelectedIndexChanged: {
                    launchermodular.settings.widgetFavoriteContactClick = model[selectedIndex].style
                }
                Component.onCompleted: {
                    if ("linphone" == launchermodular.settings.widgetFavoriteContactClick){selectedIndex = 1}
                    if ("tel" == launchermodular.settings.widgetFavoriteContactClick){selectedIndex = 0}
                }

             Text {
                id: textactionWidgets
                text: i18n.tr("When clicked : ")
                height: units.gu(5)
                anchors.right: parent.left
                anchors.rightMargin: units.gu(2)
                color: "#ffffff"
                verticalAlignment: Text.AlignVCenter
            }

            }

            

        } // column
    } //flickable
 } //rectangle settings

}
