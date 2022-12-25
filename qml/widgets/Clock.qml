import QtQuick 2.8
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import Qt.labs.settings 1.0
    
Item {
    width: listColumn.width/2
    height: units.gu(24)
        
Rectangle {
    id: rectClock
    width: parent.width
    height: units.gu(20)
    color: "transparent" 
        
Rectangle {
    id: clock
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: units.gu(16)
    height: units.gu(16)

    property int hours: clock.now.getHours()
    property int minutes: clock.now.getMinutes()
    property variant now: launchermodular.datenow
	
    onMinutesChanged: {
clockNumeric.updateNow();
	}
    color: "transparent"
    // private:
    Image {
        id: clockFace
        width: parent.width
        height: parent.height
        source: if(launchermodular.settings.backgroundColor == "#000000") {
					"clock/assets/white-face"+launchermodular.settings.backgroundAnalogHours+".png"
				}else{
					"clock/assets/black-face"+launchermodular.settings.backgroundAnalogHours+".png"
                }
    }

    Image {
        id: hourHand
        x: parent.width/2.0408; y: parent.height/4.285714286
        width: parent.width/60
        height: parent.height/3.448275862
        source: "clock/assets/hour.png"
        transform: Rotation {
            id: hourRotation
            angle: (clock.hours * 30)+((clock.minutes * 6)/12)
            origin.x: clock.width/120
            origin.y: clock.height/3.658536585

            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
    }

    Image {
        id: minuteHand
        source: "clock/assets/minute.png"
        x: parent.width/2.033898305; y: parent.height/6.451612903
        width: parent.width/60
        height: parent.height/2.714932127
        transform: Rotation {
            id: minuteRotation
            angle: clock.minutes * 6
            origin.x: clock.width/120
            origin.y: clock.height/2.843601896
            Behavior on angle {
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                    modulus: 360
                }
            }
        }
    }

    Rectangle {
        x: parent.width/2.105263158
        y: parent.height/2.054794521
        color: "red"
        width: parent.width/20
        height: parent.height/20
        radius: 50
    }
} 

Rectangle {
    id: clockNumeric
    visible: false
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    width: units.gu(16)
    height: units.gu(16)
    property variant now: if (launchermodular.settings.formatHours == "12h"){ Qt.formatTime(new Date(),"hh:mm a"); }else{ Qt.formatTime(new Date(),"hh:mm");}
 
    /*
    Timer {
        id: clockUpdaterNumeric
        interval: 1000 // update clock every second
        running: true
        repeat: true
        onTriggered:updateNow() 
    }
    */
    function updateNow() {
	if (launchermodular.settings.formatHours == "12h"){ clockNumeric.now = Qt.formatTime(new Date(),"hh:mm a"); }else{ clockNumeric.now = Qt.formatTime(new Date(),"hh:mm");}
    }
    color: "transparent"
        
    Text {
        id: clockNumericText
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter   
        
        font.pixelSize: units.gu(7)
        text:  clockNumeric.now.split(' ')[0]
        color: launchermodular.settings.textColor
    }
        
        
}
}    
    
Text {
    id: date
    anchors.top: rectClock.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    text: new Date(launchermodular.datenow).toLocaleDateString(Qt.locale())

    color: launchermodular.settings.textColor
}

    MouseArea {
        anchors.fill: parent
            onClicked:{ if (clock.visible == true){
                                clockNumeric.visible = true;
                                clock.visible = false;
                                }else{
                                clockNumeric.visible = false;
                                clock.visible = true;} }     
            onPressAndHold: {
                pageStack.push(Qt.resolvedUrl("clock/Settings.qml"))
            } // pressAndHold
    }
    
}
