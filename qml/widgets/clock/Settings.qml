import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem

    
Page {
    id: widgetSettingsClock

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings Widget Clock");
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
            
                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\"#ffffff\">"+i18n.tr("Show analog clock with digits")+"</font>"
                    control: Switch {
                        id: backgroundHoursSwitch
                        checked: if (launchermodular.settings.backgroundAnalogHours == "num"){ true; }else{ false;}
                        onClicked: if (launchermodular.settings.backgroundAnalogHours == "num"){ launchermodular.settings.backgroundAnalogHours = ""; }else{ launchermodular.settings.backgroundAnalogHours = "num";}
                    }
                }                      
        } // column
    } //flickable
 } //rectangle settings

}
