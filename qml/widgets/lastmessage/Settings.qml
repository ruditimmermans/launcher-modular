import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem

    
Page {
    id: widgetSettingsLastmessage

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
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }


            ListItem.Header {
                text: "<font color=\"#ffffff\">"+i18n.tr("Generals")+"</font>"
            }
            
                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\"#ffffff\">"+i18n.tr("View a summary")+"</font>"
                    control: Switch {
                        checked: launchermodular.settings.widgetMessageSummary
                        onClicked: if (launchermodular.settings.widgetMessageSummary == false){ launchermodular.settings.widgetMessageSummary = true; }else{ launchermodular.settings.widgetMessageSummary = false;}
                    }
                }
            

            property var model: [
            { title: "<font color=\"#ffffff\">"+i18n.tr("Nothing")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("No action")+"</font>", style:"nothing" },
            { title: "<font color=\"#ffffff\">"+i18n.tr("Default")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Open the application")+"</font>", style:"default" },
            { title: "<font color=\"#ffffff\">"+i18n.tr("Open Message")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Open the application with message")+"</font>", style:"message" }
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
                    launchermodular.settings.widgetMessageClick = model[selectedIndex].style
                }
                Component.onCompleted: {
                    if ("message" == launchermodular.settings.widgetMessageClick){selectedIndex = 2}
                    if ("default" == launchermodular.settings.widgetMessageClick){selectedIndex = 1}
                    if ("nothing" == launchermodular.settings.widgetMessageClick){selectedIndex = 0}
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
