import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.0
import "../components"
import Qt.labs.settings 1.0
import Ubuntu.History 0.1
import Ubuntu.Contacts 0.1

Item {
    id: widgetLastMessage
    width: listColumn.width/2
    height: listMessage.height+rectLastMessage.height+emptyLabel.height
        
	property string messageNumber: "" 

        
        Column {
            id: message
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width

    Rectangle{
        id: rectLastMessage
        height: units.gu(2.5)
        color: "transparent"
        Icon {
           id: iconLastMessage
            width: units.gu(2)
            height: units.gu(2)
            name: "message"
            color: launchermodular.settings.textColor
        }
        Label {
            id: titleLastMessage
            anchors.left: iconLastMessage.right
            anchors.leftMargin: units.gu(1)
            text: i18n.tr("Last Message")
            color: launchermodular.settings.textColor
        }
    }

    HistoryThreadModel {
        id: historyThreadModel
        filter: HistoryFilter {}
        sort: HistorySort {
            sortField: "lastEventTimestamp"
            sortOrder: HistorySort.DescendingOrder
        }
    }

    Label {
        id: emptyLabel
        fontSize: "small"
        anchors.top: rectLastMessage.bottom
        visible: listMessage.count === 0
        height: if(listMessage.height < 1){units.gu(3)}else{units.gu(1)}
        text: i18n.tr("No recent messages")
        color: launchermodular.settings.textColor
    }

    ListView {
        id: listMessage
        anchors.top: rectLastMessage.bottom
        height: contentHeight
        model: historyThreadModel
        width:parent.width;
        interactive: false

        delegate: Column {
            visible: index == 0
            height: index == 0 ? contentHeight : 0
            width:parent.width;
            
            Text {
                text: participants; 
                color: launchermodular.settings.textColor; 
                font.pointSize: units.gu(1.2);
            }
            Text {
                text: timestamp.toLocaleString(Qt.locale(), Locale.ShortFormat); 
                color: "#AEA79F"; 
                font.pointSize: units.gu(1);
            }
            Text {
                text: eventTextMessage; 
                elide: Text.ElideRight; 
                maximumLineCount: 1; 
                width: message.width; 
                color: launchermodular.settings.textColor; 
                font.pointSize: units.gu(1.1); 
                visible: launchermodular.settings.widgetMessageSummary;
            }
            Component.onCompleted: if(index > 0){}else{widgetLastMessage.messageNumber = participants}
        }
    }

        }
    MouseArea {
        anchors.fill: parent
            onClicked: {
                    if ("default" == launchermodular.settings.widgetMessageClick){Qt.openUrlExternally("application:///messaging-app.desktop")}
                    if ("message" == launchermodular.settings.widgetMessageClick){Qt.openUrlExternally("message:///"+widgetLastMessage.messageNumber)}
                }
            onPressAndHold:pageStack.push(Qt.resolvedUrl("lastmessage/Settings.qml"))
            
    }

}
