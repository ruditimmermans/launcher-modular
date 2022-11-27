import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import QtGraphicalEffects 1.0
import MySettings 1.0
import AppHandler 1.0
import QtQuick.Controls 2.2
import Lomiri.Components.Popups 1.3

Column {
    id: widgetFavoriteApps
    visible: if(searchField.text.length > 0){false}else{true}
    
             Timer {
                id: closeTimer
                    interval: 500; running: home.reloading; repeat: false
                    onTriggered: AppHandler.setFav(settings.coreApps.join())
                }

    
                    Item{
                        id: titleFavoriteApp
                        height: if(launchermodular.favoriteAppsModel.count != "0"){ units.gu(5) }else{units.gu(0)}
                        visible: if(launchermodular.favoriteAppsModel.count != "0"){ true }else{ false }
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
                        
                        Icon {
                           id: iconFavoriteAppState
                            anchors.right: parent.right
                            anchors.rightMargin: units.gu(3)
                            width: units.gu(2)
                            height: units.gu(2)
                            name: appFavoriteView.typegrid == "horizontal" ? "go-next" : "go-down";
                            color: launchermodular.settings.textColor
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            anchors.bottomMargin: units.gu(2)
                            onClicked: {
                                appFavoriteView.typegrid = appFavoriteView.typegrid == "horizontal" ? "vertical" : "horizontal";
                            }
                        }
                        
                    }
                    

                    GridView {
                        id: appFavoriteView
                            
                        property var typegrid: "horizontal";
                        property var heightgrid: (launchermodular.favoriteAppsModel.count != "0") ? units.gu(13)*launchermodular.settings.iconSize : units.gu(0);
                            
                        model: launchermodular.favoriteAppsModel
                                        
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                            right: parent.right
                            rightMargin: units.gu(2)
                        }
                        
                        cellHeight: iconbasesize+units.gu(5)
                        property real iconbasesize: units.gu(10)*launchermodular.settings.iconSize
                        cellWidth: Math.floor(width/Math.floor(width/iconbasesize))
                            
                        flickableDirection: appFavoriteView.typegrid == "horizontal" ? Flickable.HorizontalFlick : GridView.FlowLeftToRight;
                        flow: appFavoriteView.typegrid == "horizontal" ? GridView.FlowTopToBottom : Flickable.AutoFlickDirection;
                        
                        width:  appFavoriteView.typegrid == "horizontal" ? contentHeight : widgetFavoriteApps.width;
                        height: appFavoriteView.typegrid == "horizontal" ? appFavoriteView.heightgrid : appFavoriteView.contentHeight;
                        
              
                        delegate: Item{
                            width: appFavoriteView.cellWidth
                            height: appFavoriteView.iconbasesize

                            Image {
                                id: screenshotAppFavorite
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: units.gu(8)*launchermodular.settings.iconSize
                                height: units.gu(8)*launchermodular.settings.iconSize
                                source: icon
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
                                width: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                                height: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                                radius : "medium"
                           }
 
                            MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        listColumnApps.doAction(action)
                                    }
                            }

                            Text{
                                anchors.top: screenshotAppFavorite.bottom
                                horizontalAlignment: Text.AlignHCenter
                                anchors.topMargin: units.gu(1)
                                width: parent.width
                                font.pixelSize: units.gu(1.5)
                                wrapMode: Text.Wrap
                                text: name
                                color: launchermodular.settings.textColor
                             }
                        }

                    }
                

                
}
