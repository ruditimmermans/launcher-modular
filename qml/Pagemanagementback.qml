import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3
import "pages"
import Ubuntu.Components.Popups 0.1
import Qt.labs.folderlistmodel 2.1


Page {
    id: pageSettings

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Page management");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        launchermodular.pageModel.append({"name": "temp", "icon": "temp.svg"});
                        launchermodular.pageModel.remove(launchermodular.pageModel.count-1);
                        launchermodular.settings.page = launchermodular.getPageArray();
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
                            PopupUtils.open(listPageDialog);
                        }
                    }
               ]
               numberOfSlots: 2
            }
   }

                       Component {
                            id: listPageDialog
                            Dialog {
                                id: listPageDialogue
                                text: i18n.tr("Choose a page")
            

      Flickable {
        id: flickableFolder
        height: units.gu(22)
        contentHeight: customPageFolder.height+pageFolder.height
        flickableDirection: Flickable.VerticalFlick
        clip: true
            
    ListView {
        id: customPageFolder
        model: folderModelCustom
        interactive: false
        height: contentHeight
        width: parent.width

            FolderListModel {
                id: folderModelCustom
                nameFilters: ["*.qml"]
                folder: "/home/phablet/.launchermodular/pages/"
                showDirs: false
            }

        delegate: ListItem {
            ListItemLayout {
                height: modelLayout2.height + (divider.visible ? divider.height : 0)
                id: modelLayout2
                title.text: fileBaseName
                title.color: "black"
            }
                divider.visible: false
                onClicked: {
                    launchermodular.pageModel.append({"name": fileName, "icon": "/home/phablet/.launchermodular/pages/"+fileBaseName.toLowerCase()+"/assets/icon.svg", "data":{}, "directory": "/home/phablet/.launchermodular/pages/"});

                    PopupUtils.close(listPageDialogue);
                }
            }

    }                                    
                                    
    ListView {
        id: pageFolder
        model: folderModel
        interactive: false
        anchors.top: customPageFolder.bottom
        height: contentHeight
        width: parent.width
            
            FolderListModel {
                id: folderModel
                nameFilters: ["*.qml"]
                folder: "pages/"
                showDirs: false
            }

        delegate: ListItem {
            ListItemLayout {
                height: modelLayout2.height + (divider.visible ? divider.height : 0)
                id: modelLayout2
                title.text: fileBaseName
                title.color: "black"
            }
                divider.visible: false
                visible: if(fileName.split(".")[0] === "Home"){false; height = 0}
                onClicked: {
                    launchermodular.pageModel.append({"name": fileName, "icon": "pages/"+fileBaseName.toLowerCase()+"/assets/icon.svg", "data":{}, "directory": "pages/"});

                    PopupUtils.close(listPageDialogue);
                }
            }

    }
      }

                                Button{
                                    text: i18n.tr("Cancel")
                                    onClicked: PopupUtils.close(listPageDialogue);
                                }

                            }
                        }

Rectangle {
    id:mainsettings
        anchors.fill: parent
        color: "#111111"
        anchors.topMargin: units.gu(6)



    ListView {
        id: listPage
        anchors.fill: parent
        model: launchermodular.pageModel
        delegate: ListItem {
          height: modelLayout.height + (divider.visible ? divider.height : 0)
            ListItemLayout {
                id: modelLayout
                title.text: "<font color=\"#ffffff\">"+name.split(".")[0]+"</font>"

                Icon {
                    source: model.icon
                    SlotsLayout.position: SlotsLayout.Leading
                    width: units.gu(2)
                    id: iconPage
                    antialiasing: true
                 }
                 ColorOverlay{
                     anchors.fill: iconPage
                    SlotsLayout.position: SlotsLayout.Leading
                     source: iconPage
                     color: "#FFFFFF"
                     antialiasing: true
                 }
                
                Icon {
                    name: "toolkit_chevron-ltr_1gu"
                    SlotsLayout.position: SlotsLayout.Trailing
                    width: units.gu(2)
                }
                
            }
                divider.visible: false
                //progression: true

        leadingActions: ListItemActions {
            actions: [
                Action {
                    id: actionDelete
                    text: i18n.tr("Delete")
                    iconName: "edit-delete"
                    visible: false
                onTriggered: {
                    launchermodular.pageModel.remove(index)
                    mainloader.reloadPage()
                }
                }
            ]
        }
            Component.onCompleted: {
                if(name.split(".")[0] != "Home"){ actionDelete.visible = true }
            }
        onPressAndHold: ListView.view.ViewItems.dragMode = !ListView.view.ViewItems.dragMode

        onClicked: {pageStack.push(Qt.resolvedUrl(directory+name.split(".")[0].toLowerCase()+"/Settings.qml"),{pageIndex:index});
		console.log("clicked on"+index)
		}
            }

    ViewItems.onDragUpdated: {
        if (event.status == ListItemDrag.Moving) {
            model.move(event.from, event.to, 1);
        }
    }
    moveDisplaced: Transition {
        UbuntuNumberAnimation {
            property: "y"
        }
    }

  }

/*
        ListView {
            id: pageFavoriteView
            anchors.fill: parent
            clip: true
            orientation: ListView.Horizontal

        model: launchermodular.pageModel

        delegate: ListItem {
                        width: units.gu(20)
                        height: units.gu(37)
                        divider.visible: false

                        Image {
                            id: imgIcons
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.topMargin: units.gu(6)
                            width: parent.width-units.gu(2)
                            height: parent.height-units.gu(6)
                            source: "pages/"+name.split(".")[0].toLowerCase()+"/assets/page.png"
                            visible: false
                        }

                        UbuntuShape {
                            source: imgIcons
                            anchors.topMargin: units.gu(6)
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width-units.gu(2)
                            height: parent.height-units.gu(6)
                            radius : "medium"
                        }
                        Rectangle {
                            width: imgIcons.width;
                            height: namePage.contentHeight+units.gu(2)
                            color: "#000000"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: imgIcons.bottom
                            opacity: 0.8
                            radius: 8

                            Text{
                                id: namePage
                                anchors.verticalCenter: parent.verticalCenter
                                horizontalAlignment: Text.AlignHCenter
                                width: parent.width;
                                text : name.split(".")[0]
                                wrapMode:Text.WordWrap
                                color: "#ffffff"
                            }
                        }

                        Rectangle {
                            width: units.gu(4)
                            height: units.gu(4)
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.topMargin: units.gu(1)
                            radius: units.gu(4)

                            Icon {
                                name: "delete"
                                anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                                width: units.gu(2)
                                height: units.gu(2)
                                color: "#ED3146"
                            }

                        }



                    } // Item

        }*/





 } //rectangle settings



}
