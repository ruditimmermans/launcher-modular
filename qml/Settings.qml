import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import "pages"
import Terminalaccess 1.0
import Lomiri.Components.Popups 0.1
import LauncherModular 1.0

Page {
    id: pageSettings

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings");
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

Component {
	id: diag
 Dialog {
	id: popup
	title: "Authentification needed"
	TextField {
		id:inp
		placeholderText: "Enter password (by defaut : phablet)"
		echoMode: TextInput.Password
	}
	Button {
		text:"ok"
		onClicked: {Terminalaccess.inputLine(inp.text, false);PopupUtils.close(popup)}
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
                text: "<font color=\"#ffffff\">"+i18n.tr("Generals")+"</font>"
            }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\"#ffffff\">"+i18n.tr("Dark background")+"</font>"
                control: Switch {
                    checked:  if (launchermodular.settings.backgroundColor == "#000000"){ true; }else{ false;}
                    onClicked: {if (launchermodular.settings.backgroundColor == "#000000"){ launchermodular.settings.backgroundColor = "#ffffff"; launchermodular.settings.textColor = "#000000"; }else{ launchermodular.settings.backgroundColor = "#000000"; launchermodular.settings.textColor = "#ffffff"; }}
                }
            }

            Slider {
                id: slideOpacity
                anchors.horizontalCenter: parent.horizontalCenter;
                value: launchermodular.settings.backgroundOpacity
                maximumValue: 1.0
                minimumValue: 0
                live: true
                onValueChanged: { launchermodular.settings.backgroundOpacity = slideOpacity.value }
                onPressedChanged: { if(pressed) {
                    pageSettings.visible = false
                    slideOpacity.visible = true;
                } else { pageSettings.visible = true ; } }
            }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\"#ffffff\">"+i18n.tr("Background blur effect")+"</font>"
                control: Switch {
                    checked:  if (launchermodular.settings.backgroundBlur == "32"){ true; }else{ false;}
                    onClicked: {if (launchermodular.settings.backgroundBlur == "32"){ launchermodular.settings.backgroundBlur = "0"; }else{ launchermodular.settings.backgroundBlur = "32"; }}
                }
            }

            property var model: [
            { title: "<font color=\"#ffffff\">"+i18n.tr("None")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Icons without style")+"</font>", style:"none" },
            { title: "<font color=\"#ffffff\">"+i18n.tr("Rounded")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Icons rounded")+"</font>", style:"rounded" }
            ]

            ListItem.ItemSelector {
                id: styleIconList
                width: (parent.width-textStyleIcons.width)-units.gu(6)
                anchors.right: parent.right
                anchors.rightMargin: units.gu(2)
                model: settingsColumn.model
                delegate: OptionSelectorDelegate {
                            property var item: model.modelData ? model.modelData : model
                            text: item.title
                            subText: item.descr
                        }
                onSelectedIndexChanged: {
                    launchermodular.settings.iconStyle = model[selectedIndex].style
                }
                Component.onCompleted: {
                    if ("rounded" == launchermodular.settings.iconStyle){selectedIndex = 1}
                    if ("none" == launchermodular.settings.iconStyle){selectedIndex = 0}
                }

             Text {
                id: textStyleIcons
                text: i18n.tr("Style Icons : ")
                height: units.gu(5)
                anchors.right: parent.left
                anchors.rightMargin: units.gu(2)
                color: "#ffffff"
                verticalAlignment: Text.AlignVCenter
            }

          }

        ListItem.Header {
            text: "<font color=\"#ffffff\">"+i18n.tr("Widgets")+"</font>"
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show clock")+"</font>"
            control: Switch {
                checked: launchermodular.settings.widgetVisibleClock
                onClicked: launchermodular.settings.widgetVisibleClock = !launchermodular.settings.widgetVisibleClock
            }
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show weather")+"</font>"
            control: Switch {
                checked:
                launchermodular.settings.widgetVisibleWeather
                onClicked: launchermodular.settings.widgetVisibleWeather = !launchermodular.settings.widgetVisibleWeather
            }
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show alarms")+"</font>"
            control: Switch {
                checked: launchermodular.settings.widgetVisibleAlarm
                onClicked: launchermodular.settings.widgetVisibleAlarm = !launchermodular.settings.widgetVisibleAlarm
            }
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show last call")+"</font>"
            control: Switch {
                checked: launchermodular.settings.widgetVisibleLastcall
                onClicked: launchermodular.settings.widgetVisibleLastcall = !launchermodular.settings.widgetVisibleLastcall
            }
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show last message")+"</font>"
            control: Switch {
                checked: launchermodular.settings.widgetVisibleLastmessage
                onClicked: launchermodular.settings.widgetVisibleLastmessage = !launchermodular.settings.widgetVisibleLastmessage
            }
        }

        ListItem.Standard {
            showDivider: false
            text: "<font color=\"#ffffff\">"+i18n.tr("Show events")+"</font>"
            control: Switch {
                checked: launchermodular.settings.widgetVisibleEvent
                onClicked: launchermodular.settings.widgetVisibleEvent = !launchermodular.settings.widgetVisibleEvent
            }
        }

        } // column
    } //flickable
 } //rectangle settings


Connections {
	target: Terminalaccess
	onNeedSudoPassword: {PopupUtils.open(diag)}
       }
}
