import QtQuick 2.9
import Lomiri.Components 1.3
import QtOrganizer 5.0


Item {
    id: calendar


            
    property variant datenow: new Date()

    Timer {
        interval: 120000 // update clock every second
        running: true
        repeat: true
        onTriggered: {
            calendar.datenow = new Date()
        }
    }
    
    OrganizerModel {
        id: organizerModel
            
        startPeriod: {
            return calendar.datenow
        }
        
        endPeriod: {
            var date = calendar.datenow;
            date.setDate(date.getDate() + launchermodular.settings.limiteDaysCalendar);
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

        onExportCompleted: {
            console.log("onExportCompleted")
        }

        onImportCompleted: {
            console.log("onImportCompleted")
        }

        onItemsFetched: {
            console.log("onItemsFetched")
        }

        onModelChanged: {
            console.log("onModelChanged")
            mymodel.clear();
            var count = organizerModel.itemCount
            for ( var i = 0; i < count; i ++ ) {
                var item = organizerModel.items[i];
                if(item.itemType != 505){
                  mymodel.append( {"item": item })
                }
            }
        }
        onDataChanged: {
            console.log("onDataChanged")
        }
        manager: "eds"
    }

        ListModel {
            id: mymodel
        }

        ListView {
          id: listCalendar
            anchors.fill: parent
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            width: parent.width
            height: contentHeight
            model: mymodel

            header: Item {
                id: textCalendar
                height: units.gu(6)
                    
                Icon {
                   id: iconCalendar
                    width: units.gu(2)
                    height: units.gu(2)
                    name: "event"
                    color: launchermodular.settings.textColor
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label {
                    id: titleCalendar
                    anchors.left: iconCalendar.right
                    anchors.leftMargin: units.gu(1)
                    text: i18n.tr("Agenda")
                    color: launchermodular.settings.textColor
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
                
            delegate: ListItem {
    height: layout.height + (divider.visible ? divider.height : 0)
    divider.visible: false
    ListItemLayout {
        id: layout
        title.text: item.displayLabel
        title.color: "#FFFFFF"
        subtitle.text: {
                var evt_time = item.detail(Detail.EventTime)
                var starttime = evt_time.startDateTime;
                var endtime = evt_time.endDateTime;

                return starttime.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)+" - "+endtime.toLocaleTimeString(Qt.locale(), Locale.ShortFormat)
              }
        subtitle.color: "#AEA79F"
        summary.text: item.description
        summary.color: "#AEA79F"
        Column {
            id: timeEvent
          SlotsLayout.position: SlotsLayout.Leading
          Text{
            text: {
                    var evt_time = item.detail(Detail.EventTime)
                    var starttime = evt_time.startDateTime;
                    return Qt.formatDateTime(starttime, "d" )
                  }
            font.pointSize: units.gu(2.2)
            font.bold: true
            color: "#ffffff"
          }
          Text{
            text: {
                    var evt_time = item.detail(Detail.EventTime)
                    var starttime = evt_time.startDateTime;
                    return Qt.formatDateTime(starttime, "MMM" )
                  }
            color: "#ffffff"
          }
      }
        Item {
            id: slot
            width: secondLabel.width
            anchors.right: parent.right
            anchors.top: timeEvent.top
            anchors.topMargin: units.gu(1)
            Label {
                id: secondLabel
                text: item.location
                color: "#AEA79F"
                fontSize: "small"
                y: layout.mainSlot.y + layout.summary.y
                   + layout.summary.baselineOffset - baselineOffset
            }
        }

    }
         /*       
        MouseArea {
            anchors.fill: parent
            onClicked:{
                Qt.openUrlExternally("calendar://eventid="+item.itemId)
               // onClicked:Qt.openUrlExternally("application:///com.ubuntu.calendar_calendar.desktop")
            }
        }
        */
 
}

      }
  
}




