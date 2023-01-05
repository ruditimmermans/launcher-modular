import QtQuick 2.9
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3
import QtOrganizer 5.0

Item {
    id: widgetEvent
    width: listColumn.width/2
    height: event.height+emptyLabel.height
   
    property variant datenowEvent: new Date()

    Timer {
        interval: 1200001 
        running: true
        repeat: true
        onTriggered: {
            widgetEvent.datenowEvent = new Date()
        }
    }        
        
        Rectangle {
            id: event
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: rectEvent.height+listEvent.height
            color: "transparent"

    Rectangle{
        id: rectEvent
        height: units.gu(2.5)
        color: "transparent"
        Icon {
           id: iconEvent
            width: units.gu(2)
            height: units.gu(2)
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            name: "event"
            color: launchermodular.settings.textColor
        }
        Label {
            id: titleEvent
            anchors.left: iconEvent.right
            anchors.leftMargin: units.gu(1)
            text: i18n.tr("Events")
            color: launchermodular.settings.textColor
        }
    }

            

                
            
OrganizerModel {
    id: organizerModel
        
        startPeriod: {
            return widgetEvent.datenowEvent
        }
    
    endPeriod: {
        var date = widgetEvent.datenowEvent;
        date.setDate(date.getDate() + launchermodular.settings.limiteDaysWidgetEvent);
        return date
    }

    sortOrders: [
        SortOrder{
          id: sortOrder
            blankPolicy: SortOrder.BlanksFirst
            detail: Detail.EventTime
            field: EventTime.FieldStartDateTime
            direction: Qt.AscendingOrder
        }
    ]


    onModelChanged: {
        mymodel.clear();
        var count = organizerModel.itemCount
        for ( var i = 0; i < count; i ++ ) {
            var item = organizerModel.items[i];
            if(item.itemType != 505){
              if(mymodel.count < launchermodular.settings.limiteItemWidgetEvent){
                mymodel.append( {"item": item })
              }
            }
        }
    }

    manager: "eds"
}

    ListModel {
        id: mymodel
    }

    Label {
        id: emptyLabel
        fontSize: "small"
        anchors.top: rectEvent.bottom
        visible: listEvent.count === 0
        text: i18n.tr("No events")
        color: launchermodular.settings.textColor
    }

    ListView {
      id: listEvent
        anchors.top: rectEvent.bottom
        height: contentHeight
        model: mymodel
        interactive: false
            
        delegate: Row {
            spacing: units.gu(0.7)
            Text {
              text: {
                      var evt_time = item.detail(Detail.EventTime)
                      var starttime = evt_time.startDateTime;

                      if(index != 0){
                        if(Qt.formatDateTime(starttime, "MMM d" ) != Qt.formatDateTime(mymodel.get(index-1).item.detail(Detail.EventTime).startDateTime, "MMM d" )){
                          return Qt.formatDateTime(starttime, "MMM d" )
                        }
                      }else{
                        return Qt.formatDateTime(starttime, "MMM d" )
                      }

                    }
              horizontalAlignment: Text.AlignRight
              width: units.gu(4);
              color: launchermodular.settings.textColor;
              font.pointSize: units.gu(1.2);
            }
            Rectangle { height: parent.height; width: units.gu(0.1); color: "#E95420"; }
            Column{
                Text { text: item.displayLabel; wrapMode: Text.WordWrap; elide: Text.ElideRight; width: event.width-units.gu(4); color: launchermodular.settings.textColor; font.pointSize: units.gu(1.2);}
                Text { text: {
                        var evt_time = item.detail(Detail.EventTime)
                        var starttime = evt_time.startDateTime;
                        return Qt.formatDateTime(starttime, "hh:mm" )+" "+item.description
                      }
                      elide: Text.ElideRight;
                      maximumLineCount: 1;
                      width: event.width-units.gu(4);
                      color: "#AEA79F"; font.pointSize: units.gu(1.2);}
            }

        }
    }

        }
    
    MouseArea {
        anchors.fill: parent
        onClicked:Qt.openUrlExternally("application:///com.lomiri.calendar_calendar.desktop")
        onPressAndHold: pageStack.push(Qt.resolvedUrl("event/Settings.qml"))

    }
    
}
