import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtGraphicalEffects 1.0
import MySettings 1.0
import AppHandler 1.0
import GSettings 1.0
import QtQuick.Controls 2.2
import Ubuntu.Components.Popups 1.3

Column {
    id: widgetFavoriteApps
    visible: if(searchField.text.length > 0){false}else{true}
    
             Timer {
                id: closeTimer
                    interval: 500; running: home.reloading; repeat: false
                    onTriggered: AppHandler.setFav(settings.coreApps.join())
                }
                
                GSettings {
                    id: settings
                    schema.id: "com.canonical.Unity.ClickScope"        
                    onChanged: AppHandler.setFav(settings.coreApps.join())
                    Component.onCompleted: AppHandler.setFav(settings.coreApps.join())
                }
    
                    Item{
                        id: titleFavoriteApp
                        height: if(AppHandler.fav_appsinfo.length != "0"){ units.gu(5)}else{units.gu(0)}
                        visible: if(AppHandler.fav_appsinfo.length != "0"){ true }else{ false }
                        width: parent.width
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                        }
                        
                        Icon {
                           id: iconFavoriteApp
                            width: units.gu(2)
                            height: units.gu(2)
                            name: "starred"
                            color: launchermodular.settings.textColor
                        }

                        Label {
                            anchors.left: iconFavoriteApp.right
                            anchors.leftMargin: units.gu(1)
                            text: i18n.tr("Favorite Apps")
                            color: launchermodular.settings.textColor
                        }
                                        
                    }
                    

                    ListView {
                        id: appFavoriteView
                        model: AppHandler.fav_appsinfo.length
                        width: parent.width
                        height: if(AppHandler.fav_appsinfo.length != "0"){ units.gu(13)}else{units.gu(0)}
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                            right: parent.right
                            rightMargin: units.gu(2)
                        }
                        //clip: true
                        orientation: ListView.Horizontal
                                                    
                        delegate: Item{
                            width: units.gu(12)
                            height: units.gu(13)

                            property var fav: AppHandler.fav_appsinfo[index]

                            Image {
                                id: screenshotAppFavorite
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: units.gu(8)
                                height: units.gu(8)
                                source: fav.icon
                                visible: if (launchermodular.settings.iconStyle == "none") { true;}else{ false;}
                            }

                            OpacityMask {
                                anchors.fill: screenshotAppFavorite
                                source: screenshotAppFavorite
                                maskSource: Rectangle {
                                    width: screenshotAppFavorite.width
                                    height: screenshotAppFavorite.height
                                    radius: units.gu(8)
                                    color: if (launchermodular.settings.iconStyle == "rounded") { "";}else{ "transparent";}
                                    visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                                }
                            }

                            UbuntuShape {
                                source: screenshotAppFavorite
                                anchors.horizontalCenter: parent.horizontalCenter
                                aspect: UbuntuShape.Flat
                                width: if (launchermodular.settings.iconStyle == "default") { units.gu(8);}else{ units.gu(0);}
                                height: if (launchermodular.settings.iconStyle == "default") { units.gu(8);}else{ units.gu(0);}
                                radius : "medium"


                            }
                            
                            

                       Component {
                            id: appsDialogFav
                            Dialog {
                                id: appsDialogueFav

                                title: fav.name
                                text: fav.getProp("Comment")


                                Rectangle {
                                    height: units.gu(5)
                                    width: parent.width
                                    Button {
                                        visible: false // todo not work actualy
                                        anchors.left: parent.left
                                        id: uninstallButton
                                        text: i18n.tr("Uninstall")
                                        height: units.gu(4)
                                        width: (parent.width/2)-units.gu(2)
                                        contentItem: Text {
                                            text: uninstallButton.text
                                            font: uninstallButton.font
                                            color: "#ffffff"
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                        }

                                        background: Rectangle {
                                            radius: units.gu(1.5)
                                            color: "#E95420"
                                        }
                                        onClicked: {
                                            PopupUtils.close(appsDialogueFav);
                                            Terminalaccess.run("sudo -S click unregister --user=phablet "+fav.getProp("package_name").split("_")[0])
						
                                            }
                                    }
                                    Button{
                                        anchors.right: parent.right
                                        text: i18n.tr("Cancel")
                                        height: units.gu(4)
                                        width: (parent.width/2)-units.gu(2)
                                        background: Rectangle {
                                            radius: units.gu(1.5)
                                            color: "#F6F6F5"
                                        }
                                        onClicked: {
                                            onClicked: PopupUtils.close(appsDialogueFav);
                                        }
                                    }


                                }

                            }
                        }
                            
                            
                            MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        listColumnApps.doAction(fav.action)
                                    }
                                    onPressAndHold: {
                                        PopupUtils.open(appsDialogFav);
                                    } // pressAndHold
                            }


                            Text{
                                anchors.top: screenshotAppFavorite.bottom
                                horizontalAlignment: Text.AlignHCenter
                                anchors.topMargin: units.gu(1)
                                width: parent.width
                                font.pixelSize: units.gu(1.5)
                                wrapMode: Text.WordWrap
                                text: fav.name
                                color: launchermodular.settings.textColor
                             }
                        }

                    }
                

                
}
