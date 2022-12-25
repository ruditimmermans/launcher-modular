import QtQuick 2.8
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItemHeader
import AppHandler 1.0
import Lomiri.Components.Popups 0.1

Page {
    id: pageSettingsHome

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
                        launchermodular.settings.favoriteApps = launchermodular.getFavoriteAppsArray();
                        pageStack.pop();
                    }
                }
            ]
            trailingActionBar {
                actions: [
                    Action {
                        iconName: "add"
                        text: "add"
                        onTriggered: {
                            PopupUtils.open(listAppDialog);
                        }
                    }
               ]
               numberOfSlots: 2
            }
   }


   Component {
        id: listAppDialog
        Dialog {
            id: listAppDialogue


            ListView {

                model: AppHandler.appsinfo.length
                height: pageSettingsHome.height*0.65

                delegate: ListItem {

			         property var elem: AppHandler.appsinfo[index]

                    ListItemLayout {
                        height: modelLayout2.height + (divider.visible ? divider.height : 0)
                        id: modelLayout2
                        title.text: elem.name
                        title.color: "black"
                        LomiriShape {
                            source: Image {
                                id: screenshotAppFavorite
                                source: elem.icon
                                smooth: true
                                antialiasing: true
                            }
                            SlotsLayout.position: SlotsLayout.Leading;
                            width: units.gu(4)
                            height: width
                            radius : "medium"
                        }

                    }
                        divider.visible: false
                        onClicked: {

                         launchermodular.favoriteAppsModel.append({"name": elem.name, "icon": elem.icon, "action": elem.action});


                            PopupUtils.close(listAppDialogue);
                        }
                    }

            }

            Button{
                text: i18n.tr("Cancel")
                color: LomiriColors.orange
                onClicked: PopupUtils.close(listAppDialogue);
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
        contentHeight: settingsColumn.childrenRect.height
        flickableDirection: Flickable.VerticalFlick
        clip: true


        Column {
            id: settingsColumn
            anchors.fill: parent


        ListItemHeader.Header {
            id: titleFavoriteAppsManagement
            text: "<font color=\"#ffffff\">"+i18n.tr("Favorite apps management")+"</font>"
        }

        ListView {
            id: listAppFavAdded
            model: launchermodular.favoriteAppsModel
            width: parent.width
            height: contentHeight
            delegate: ListItem {

                divider.visible: false
                height: modelLayout.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: modelLayout
                title.text: "<font color=\"#ffffff\">"+name+"</font>"
                    LomiriShape {
                        source: Image {
                            id: screenshotAppFavorite
                            source: icon
                            smooth: true
                            antialiasing: true
                        }
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(4)
                        height: width
                        radius : "medium"
                    }
            }

        leadingActions: ListItemActions {
            actions: [
                Action {
                    id: actionDelete
                    text: i18n.tr("Delete")
                    iconName: "edit-delete"
                    onTriggered: launchermodular.favoriteAppsModel.remove(index)

                }
            ]
        }
            onPressAndHold: {
                ListView.view.ViewItems.dragMode = !ListView.view.ViewItems.dragMode
            }

            }
            ViewItems.onDragUpdated: {
                if (event.status == ListItemDrag.Moving) {
                    model.move(event.from, event.to, 1);
                }
            }

            moveDisplaced: Transition {
                LomiriNumberAnimation {
                    property: "y"
                }
            }
        }



        } // column
    } //flickable
 } //rectangle settings

    Component.onCompleted: {
		AppHandler.permaFilter()
		AppHandler.permaFilter("NoDisplay", "^(?!true$).*$") //keep the one that have NOT NoDisplay=true
    AppHandler.permaFilter("Icon",  "/.*$")
		AppHandler.sort()
	}

}
