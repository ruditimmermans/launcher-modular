import QtQuick 2.8
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import Lomiri.Components.Popups 1.0
import "../components"
import Qt.labs.settings 1.0
import Lomiri.History 0.1
import Lomiri.Contacts 0.1

Item {
    width: listColumn.width/2
    height: listCall.height+rectLastCall.height+emptyLabel.height

    
        Column {
            id: event
            width: parent.width
                
	property string callNumber: "" 

    Rectangle{
        id: rectLastCall
        height: units.gu(2.5)
        color: "transparent"
        Icon {
           id: iconLastCall
            width: units.gu(2)
            height: units.gu(2)
            name: "call-start"
            color: launchermodular.settings.textColor
        }
        Label {
            id: titleLastCall
            anchors.left: iconLastCall.right
            anchors.leftMargin: units.gu(1)
            text: i18n.tr("Last Call")
            color: launchermodular.settings.textColor
        }
    }

        HistoryThreadModel {
            id: historyEventModel
            filter: HistoryFilter {}
            type: HistoryThreadModel.EventTypeVoice
            sort: HistorySort {
                sortField: "lastEventTimestamp"
                sortOrder: HistorySort.DescendingOrder
            }
        }

        Label {
            id: emptyLabel
            fontSize: "small"
            anchors.top: rectLastCall.bottom
            visible: listCall.count === 0
            height: if(listCall.height < 1){units.gu(3)}else{units.gu(2)}
            text: i18n.tr("No recent calls")
            color: launchermodular.settings.textColor
        }

    ListView {
        id: listCall
        anchors.top: rectLastCall.bottom
        model: historyEventModel
        height: contentHeight
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
            Component.onCompleted: if(index > 0){}else{event.callNumber = participants}
        }
    }

            

        }
    MouseArea {
        anchors.fill: parent
            onClicked: {
                    if ("default" == launchermodular.settings.widgetCallClick){Qt.openUrlExternally("application:///dialer-app.desktop")}
                    if ("dial" == launchermodular.settings.widgetCallClick){Qt.openUrlExternally("tel:///"+event.callNumber)}
                }
            onPressAndHold: pageStack.push(Qt.resolvedUrl("lastcall/Settings.qml"))
    }
    
}
