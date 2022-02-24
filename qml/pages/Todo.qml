import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import "todo"
import Qt.labs.settings 1.0

Item {
    id: todo 
    anchors.fill: parent
    anchors {
        rightMargin: units.gu(4)
        leftMargin: units.gu(4)
        topMargin: units.gu(4)
    }




    ListView{
        id:todoList
        anchors.fill: parent
        //headerPositioning: ListView.OverlayHeader

        header:Rectangle {
                id: todo
                height: units.gu(5)
                color: "transparent"
                anchors {
                    left: parent.left
                    right: parent.right
                }
                Rectangle {
                    id: colortodo
                    color: launchermodular.settings.backgroundColor
                    radius: units.gu(1)
                    opacity: 0.3
                    anchors.fill: parent
                }
                Icon {
                    id: iconNote
                    anchors {
                        left: todo.left
                        rightMargin: units.gu(1)
                        leftMargin: units.gu(1)
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*0.5
                    width: height
                    name: "note"
                }
                TextField {
                    id: todoField
                    anchors {
                        left: iconNote.right
                        right: parent.right
                    }
                    height: todo.height
                    color: launchermodular.settings.textColor
                        background: Rectangle {
                                                height: parent.height
                                                color: "transparent"
                                              }
                    maximumLength: 25
                    placeholderText: i18n.tr("new todo")
                    Keys.onReturnPressed: {
                        TodoModel.save(todoField.text)
                        todoField.text = ""
                    }
                }
                /*
                Icon {
                    id: iconAddTodo
                    anchors {
                        right: todo.right
                        rightMargin: units.gu(1)
                        leftMargin: units.gu(1)
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height*0.5
                    width: height
                    name: "add"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            TodoModel.save(todoField.text)
                            todoField.text = ""
                        }
                    }
                }*/
            }

        model:TodoModel.itemModel
        delegate:ListItem {
            height: layout.height + (divider.visible ? divider.height : 0)
            divider.visible: false
            ListItemLayout {
                id: layout
                title.text: name
                title.color: launchermodular.settings.textColor
                title.font.strikeout: checkbox.checked
                title.textSize: Label.Large
                    
              CheckBox {
                    id: checkbox
                    SlotsLayout.position: SlotsLayout.Trailing
                    checked: done
                    indicator.width: units.gu(3)
                    indicator.height: units.gu(3)
                    onCheckedChanged: {
                        TodoModel.done(index, checked)
                    }
                }
            }
            
        leadingActions: ListItemActions {
            actions: [
                Action {
                    id: actionDelete
                    text: i18n.tr("Delete")
                    iconName: "edit-delete"
                    onTriggered: {
                        TodoModel.remove(index)
                    }
                }
            ]
        }
            
                    MouseArea {
                        anchors.fill: parent
                            onClicked:{
                                checkbox.toggle()                            
                            }
                    }
        }       
        
    

    }



}
