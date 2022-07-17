import QtQuick 2.9
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtContacts 5.0
import QtGraphicalEffects 1.0

Column {
    id: widgetFavoriteContacts
    visible: if(searchField.text.length > 0){false}else{true}

                    Item{
                        id: titleFavoriteContact
                        height: if(contactFavoriteView.count != "0"){ units.gu(5)}else{units.gu(0)}
                        visible: if(contactFavoriteView.count != "0"){ true }else{ false }
                        width: parent.width
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                        }
                        
                        Icon {
                           id: iconFavoriteContact
                            width: units.gu(2)
                            height: units.gu(2)
                            name: "account"
                            color: launchermodular.settings.textColor
                        }

                        Label {
				            id:titleFavoriteContactText	
                            anchors.left: iconFavoriteContact.right
                            anchors.leftMargin: units.gu(1)
                            text: i18n.tr("Favorite Contacts")
                            color: launchermodular.settings.textColor
                        }
                        
                        
                        Icon {
                           id: iconFavoriteContactState
                            anchors.right: parent.right
                            anchors.rightMargin: units.gu(3)
                            width: units.gu(2)
                            height: units.gu(2)
                            name: contactFavoriteView.typegrid == "horizontal" ? "go-next" : "go-down";
                            color: launchermodular.settings.textColor
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            anchors.bottomMargin: units.gu(2)
                            onClicked: {
                                contactFavoriteView.typegrid = contactFavoriteView.typegrid == "horizontal" ? "vertical" : "horizontal";
                            }
                        }
                        
                    }

                        
               
ContactModel {
        id: contactModel
         
    filter: DetailFilter {
            id: favouritesFilter

            detail: ContactDetail.Favorite
            field: Favorite.Favorite
            value: true
            matchFlags: DetailFilter.MatchExactly
        }

    
    manager: "galera"
    }
                    
    GridView {
        id: contactFavoriteView
            
        property var typegrid: "horizontal";
        property var heightgrid: (contactFavoriteView.count != "0") ? units.gu(13)*launchermodular.settings.iconSize : units.gu(0);
        
        model: contactModel 

       anchors {
            left: parent.left
            leftMargin: units.gu(2)
            right: parent.right
            rightMargin: units.gu(2)
        }            
            
        cellHeight: iconbasesize+units.gu(5)
        property real iconbasesize: units.gu(10)*launchermodular.settings.iconSize
        cellWidth: Math.floor(width/Math.floor(width/iconbasesize))

        flickableDirection: contactFavoriteView.typegrid == "horizontal" ? Flickable.HorizontalFlick : GridView.FlowLeftToRight;
        flow: contactFavoriteView.typegrid == "horizontal" ? GridView.FlowTopToBottom : Flickable.AutoFlickDirection;

        width: contactFavoriteView.typegrid == "horizontal" ? contentHeight : widgetFavoriteContacts.width;
        height: contactFavoriteView.typegrid == "horizontal" ? contactFavoriteView.heightgrid : contactFavoriteView.contentHeight;
        

            
        delegate: Flipable {
            id: flipable
            width: contactFavoriteView.cellWidth
            height: contactFavoriteView.iconbasesize

            property bool flipped: false
                
             Timer {
                id: closeTimer
                    interval: 2500; running: false; repeat: false
                    onTriggered: flipable.flipped = false
                }

            front: Item{
                width: contactFavoriteView.cellWidth
                height: contactFavoriteView.iconbasesize
                    

                Image {
                    id: screenshotContactFavorite
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gu(8)*launchermodular.settings.iconSize
                    height: units.gu(8)*launchermodular.settings.iconSize
                    source: contact.avatar.imageUrl != "" ? contact.avatar.imageUrl : "image://theme/stock_contact"
                    visible: launchermodular.settings.iconStyle == "none"
                    fillMode: Image.PreserveAspectCrop
                }

                OpacityMask {
                    anchors.fill: screenshotContactFavorite
                    source: screenshotContactFavorite
                    maskSource: Rectangle {
                        width: screenshotContactFavorite.width
                        height: screenshotContactFavorite.height
                        radius: units.gu(8)
                        color: if (launchermodular.settings.iconStyle == "rounded") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                    }
                }

                UbuntuShape {
                    source: screenshotContactFavorite
                    anchors.horizontalCenter: parent.horizontalCenter
                    aspect: UbuntuShape.Flat
                    width: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                    height: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                    radius : "medium"
                    backgroundColor: "white"
                    sourceFillMode: UbuntuShape.PreserveAspectCrop

                }
                MouseArea {
                    anchors.fill: parent
                        onClicked: {
                            flipable.flipped = !flipable.flipped
                            closeTimer.running = true
                        }
                        onPressAndHold: pageStack.push(Qt.resolvedUrl("favoritecontact/Settings.qml"))
                }


                Text{
                    anchors.top: screenshotContactFavorite.bottom
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: units.gu(1)
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: screenshotContactFavorite.width+2
                    font.pixelSize: units.gu(1.5)
                    wrapMode: Text.WordWrap
                    text: contact.name.firstName + " " + contact.name.lastName
                    color: launchermodular.settings.textColor
                 }

            }
            
            
            back: Item{
                width: contactFavoriteView.cellWidth
                height: contactFavoriteView.iconbasesize                    
                    
                Rectangle{
                    id: screenshotContactFavoriteFlip
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gu(8)*launchermodular.settings.iconSize
                    height: units.gu(8)*launchermodular.settings.iconSize
                    color: "white"
                    visible: launchermodular.settings.iconStyle == "none"
                    Row {
                        anchors.fill: parent
                        Item{
                            height: parent.height
                            width: (parent.width/2)-0.5
                            Icon {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: units.gu(2)
                                height: units.gu(2)
                                name: "call-start"
                                color: "green"
                            } 
                        }
                        
                        Rectangle {
                            color: "black"
                            height: parent.height
                            width: 0.5
                        }

                        Item{
                            height: parent.height
                            width: (parent.width/2)-0.5
                            Icon {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: units.gu(2)
                                height: units.gu(2)
                                name: "message"
                                color: "orange"
                            }    
                            
                        }

                    }
                }


                OpacityMask {
                    anchors.fill: screenshotContactFavoriteFlip
                    source: screenshotContactFavoriteFlip
                    maskSource: Rectangle {
                        width: screenshotContactFavoriteFlip.width
                        height: screenshotContactFavoriteFlip.height
                        radius: units.gu(8)
                        color: if (launchermodular.settings.iconStyle == "rounded") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                    }
                }

                OpacityMask {
                    anchors.fill: screenshotContactFavoriteFlip
                    source: screenshotContactFavoriteFlip
                    maskSource: Rectangle {
                        width: screenshotContactFavoriteFlip.width
                        height: screenshotContactFavoriteFlip.height
                        radius: units.gu(1.5)
                        color: if (launchermodular.settings.iconStyle == "default") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "default") { false;}else{ true;}
                    }
                }


                Text{
                    anchors.top: screenshotContactFavoriteFlip.bottom
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: units.gu(1)
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: screenshotContactFavoriteFlip.width+2
                    font.pixelSize: units.gu(1.5)
                    wrapMode: Text.WordWrap
                    text: contact.name.firstName + " " + contact.name.lastName
                    color: launchermodular.settings.textColor
                 }
                
                
                Item{
                    height: units.gu(8)
                    width: (screenshotContactFavoriteFlip.width/2)-0.5
                    anchors.left: screenshotContactFavoriteFlip.left
                    MouseArea {
                        anchors.fill: parent
                            onClicked: {
                                flipable.flipped = false
                                Qt.openUrlExternally(launchermodular.settings.widgetFavoriteContactClick+":///"+contact.phoneNumber.number)
                            } 
                    }
                }
                Item{
                    height: units.gu(8)
                    width: (screenshotContactFavoriteFlip.width/2)-0.5
                    anchors.right: screenshotContactFavoriteFlip.right
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                                flipable.flipped = false
                                Qt.openUrlExternally("message:///"+contact.phoneNumber.number)
                            } 
                    }
                }
                

            }

            transform: Rotation {
                id: rotation
                origin.x: flipable.width/2
                origin.y: flipable.height/2
                axis.x: 0; axis.y: 1; axis.z: 0   
                angle: 0 
            }

            states: State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
                when: flipable.flipped
            }

            transitions: Transition {
                NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
            }


        }

        
        
        

    }

                

        
}
