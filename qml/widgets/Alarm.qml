import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem



Item {
    id: alarm
    width: listColumn.width/2
    height: rectAlarm.height+listAlarmView.height+emptyLabel.height

        Column {
            id: columnalarm
            width: parent.width
                
    Rectangle{
        id: rectAlarm
        height: units.gu(2.5)
        color: "transparent"
        Icon {
           id: iconAlarm
            width: units.gu(2)
            height: units.gu(2)
            name: "alarm"
            color: launchermodular.settings.textColor
        }
        Label {
            id: titleAlarm
            anchors.left: iconAlarm.right
            anchors.leftMargin: units.gu(1)
            text: i18n.tr("Alarms")
            color: launchermodular.settings.textColor
        }
    }

    Label {
        id: emptyLabel
        fontSize: "small"
        anchors.top: rectAlarm.bottom
        visible: listAlarmView.height < 1
        height: if(listAlarmView.height < 1){units.gu(3)}else{units.gu(2)}
        text: i18n.tr("No active alarm")
        color: launchermodular.settings.textColor
    }


ListView {
  id: listAlarmView
  anchors.top: rectAlarm.bottom
    model: AlarmModel {}
    width: parent.width
    height: contentHeight
    delegate: Item{
        width: parent.width
      visible: model.enabled
      height: if(model.enabled == false){0}else{textAlarm.contentHeight+hourAlarm.contentHeight}
      Text {id: textAlarm; width: parent.width; wrapMode:Text.WordWrap; text: date.toLocaleDateString(Qt.locale()); color: launchermodular.settings.textColor; font.pointSize: units.gu(1.2);}
      Text {id: hourAlarm; anchors.top: textAlarm.bottom; width: parent.width; wrapMode:Text.WordWrap; text: i18n.tr("at")+" "+Qt.formatTime(date); color: "#AEA79F"; font.pointSize: units.gu(1);}
    }
}
        }
    
    MouseArea {
        anchors.fill: parent
            onClicked:Qt.openUrlExternally("application:///com.ubuntu.clock_clock.desktop")
    }

}

