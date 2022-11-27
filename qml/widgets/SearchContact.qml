import QtQuick 2.4
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import QtContacts 5.0
import QtGraphicalEffects 1.0

Item {
    id: widgetSearchContacts
    width: parent.width
    height: if(searchField.text.length > 0 && contactSearchView.contentWidth > 0){titleSearchContact.height+rectContactSearchView.height}else{units.gu(0)}

    property string searchContact: searchField.text

                    Item{
                        id: titleSearchContact
                        height: if(searchField.text.length > 0 && contactSearchView.contentWidth > 0){ units.gu(5)}else{units.gu(0)}
                        visible: if(searchField.text.length > 0 && contactSearchView.contentWidth > 0){ true }else{ false }
                        width: parent.width
                        anchors {
                            left: parent.left
                            leftMargin: units.gu(2)
                        }
                        
                        Icon {
                           id: iconSearchContact
                            width: units.gu(2)
                            height: units.gu(2)
                            name: "account"
                            color: launchermodular.settings.textColor
                        }

                        Label {
				            id:titleSearchContactText	
                            anchors.left: iconSearchContact.right
                            anchors.leftMargin: units.gu(1)
                            text: i18n.tr("Search Contacts")
                            color: launchermodular.settings.textColor
                        }
                    }
    
                Column {
                    id: rectContactSearchView
                    anchors.top: titleSearchContact.bottom
                    width: launchermodular.width

                        
ContactModel {
        id: contactModel
     
    manager: "galera"
    }
  
    ListView {
        id: contactSearchView
        model: contactModel 
        height: if(searchField.text.length > 0 && contentWidth > 0){ units.gu(13)*launchermodular.settings.iconSize}else{units.gu(0)}
        width: parent.width
        clip: true
        orientation: ListView.Horizontal
        delegate: Flipable {
            id: flipable
            width: contact.name.lastName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) | contact.name.firstName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) ? gview.cellWidth : 0 
            height: contact.name.lastName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) | contact.name.firstName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) ? units.gu(13)*launchermodular.settings.iconSize : 0
            visible: contact.name.lastName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) | contact.name.firstName.toLowerCase().includes(widgetSearchContacts.searchContact.toLowerCase()) ? true : false
                
            property bool flipped: false
                
             Timer {
                id: closeTimer
                    interval: 2500; running: false; repeat: false
                    onTriggered: flipable.flipped = false
                }

            front: Item{
                width: gview.cellWidth*launchermodular.settings.iconSize
                height:units.gu(13)*launchermodular.settings.iconSize
                    

                Image {
                    id: screenshotContactSearch
                    anchors.right: parent.right
                    width: units.gu(8)*launchermodular.settings.iconSize
                    height: units.gu(8)*launchermodular.settings.iconSize
                    source: contact.avatar.imageUrl != "" ? contact.avatar.imageUrl : "image://theme/stock_contact"
                    visible: launchermodular.settings.iconStyle == "none"
                    fillMode: Image.PreserveAspectCrop
                }

                OpacityMask {
                    anchors.fill: screenshotContactSearch
                    source: screenshotContactSearch
                    maskSource: Rectangle {
                        width: screenshotContactSearch.width
                        height: screenshotContactSearch.height
                        radius: units.gu(8)
                        color: if (launchermodular.settings.iconStyle == "rounded") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                    }
                }

                UbuntuShape {
                    source: screenshotContactSearch
                    anchors.right: parent.right
                    aspect: UbuntuShape.Flat
                    width: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                    height: if (launchermodular.settings.iconStyle == "default") { units.gu(8)*launchermodular.settings.iconSize;}else{ units.gu(0);}
                    radius : "medium"
                    backgroundColor: "white"

                }
                MouseArea {
                    anchors.fill: parent
                        onClicked: {
                            flipable.flipped = !flipable.flipped
                            closeTimer.running = true
                        }
                }


                Text{
                    anchors.top: screenshotContactSearch.bottom
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: units.gu(1)
                    anchors.right: parent.right
                    width: screenshotContactSearch.width+2
                    font.pixelSize: units.gu(1.5)
                    wrapMode: Text.WordWrap
                    text: contact.name.firstName + " " + contact.name.lastName
                    color: launchermodular.settings.textColor
                 }

            }
            
            
            back: Item{
                width: gview.cellWidth*launchermodular.settings.iconSize
                height:units.gu(13)*launchermodular.settings.iconSize
                    
                    
                Rectangle{
                    id: screenshotContactSearchFlip
                    anchors.right: parent.right
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
                    anchors.fill: screenshotContactSearchFlip
                    source: screenshotContactSearchFlip
                    maskSource: Rectangle {
                        width: screenshotContactSearchFlip.width
                        height: screenshotContactSearchFlip.height
                        radius: units.gu(8)
                        color: if (launchermodular.settings.iconStyle == "rounded") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                    }
                }

                OpacityMask {
                    anchors.fill: screenshotContactSearchFlip
                    source: screenshotContactSearchFlip
                    maskSource: Rectangle {
                        width: screenshotContactSearchFlip.width
                        height: screenshotContactSearchFlip.height
                        radius: units.gu(1.5)
                        color: if (launchermodular.settings.iconStyle == "default") { "white";}else{ "transparent";}
                        visible: if (launchermodular.settings.iconStyle == "default") { false;}else{ true;}
                    }
                }


                Text{
                    anchors.top: screenshotContactSearchFlip.bottom
                    horizontalAlignment: Text.AlignHCenter
                    anchors.topMargin: units.gu(1)
                    anchors.right: parent.right
                    width: screenshotContactSearchFlip.width+2
                    font.pixelSize: units.gu(1.5)
                    wrapMode: Text.WordWrap
                    text: contact.name.firstName + " " + contact.name.lastName
                    color: launchermodular.settings.textColor
                 }
                
                
                Item{
                    height: units.gu(8)*launchermodular.settings.iconSize
                    width: (screenshotContactSearchFlip.width/2)-0.5
                    anchors.left: screenshotContactSearchFlip.left
                    MouseArea {
                        anchors.fill: parent
                            onClicked: {
                                flipable.flipped = false
                                Qt.openUrlExternally("tel:///"+contact.phoneNumber.number)
                            } 
                    }
                }
                Item{
                    height: units.gu(8)*launchermodular.settings.iconSize
                    width: (screenshotContactSearchFlip.width/2)-0.5
                    anchors.right: screenshotContactSearchFlip.right
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

        
}
