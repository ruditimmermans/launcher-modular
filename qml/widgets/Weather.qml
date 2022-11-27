import QtQuick 2.9
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem
import "../components"
import Qt.labs.settings 1.0
import QtQuick.XmlListModel 2.0
import QtGraphicalEffects 1.0

Item {
    width: listColumn.width/2
    height: units.gu(24)

        Rectangle {
            id: weather
            anchors.horizontalCenter: parent.horizontalCenter
            width: units.gu(16)
            height: units.gu(20)
            color: "transparent"

    Text{
        id: configure
        visible: if (launchermodular.settings.cityName && launchermodular.settings.apiOpenWeatherMap) { false;}else{ true;}
        text: i18n.tr("Please long press here to configure")
        width: units.gu(16)
        color: launchermodular.settings.textColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        wrapMode: Text.WordWrap
    }

    ActivityIndicator {
        anchors.centerIn: parent
        running:  if ( modelWeather.count == 0 && configure.visible == false) { true;}else{ false;}
    }

    Timer {
        interval: 1200000; running: true; repeat: true
        onTriggered: {
                    modelWeather.reload()
                  }
    }


XmlListModel {
    id: modelWeather
    source: "https://api.openweathermap.org/data/2.5/weather?q="+launchermodular.settings.cityName+launchermodular.settings.unitsFormat+"&lang="+Qt.locale().name.split("_")[0]+"&mode=xml&appid="+launchermodular.settings.apiOpenWeatherMap;
    query: "/current"

    XmlRole { name: "icon"; query: "weather/string(@icon)" }
    XmlRole { name: "city"; query: "city/string(@name)" }
    XmlRole { name: "desc"; query: "weather/string(@value)" }
    XmlRole { name: "temp"; query: "temperature/string(@value)" }
    XmlRole { name: "windspeed"; query: "wind/speed/string(@value)" }
    XmlRole { name: "winddir"; query: "wind/direction/string(@code)" }
    XmlRole { name: "humidityvalue"; query: "humidity/string(@value)" }
    XmlRole { name: "humidityunit"; query: "humidity/string(@unit)" }


}


        ListView {
            id: listViewWeather
            width: units.gu(16)
            height: units.gu(20)
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            model: modelWeather

            delegate: Component {
                Rectangle {
                    color: "transparent"
                    width: units.gu(16)
                    height: units.gu(20)
                    visible: index == 0

                Image {
                        id: iconWeather
                        source: "weather/assets/"+icon+".svg"
                        width: units.gu(16)
                        height: units.gu(16)
                        sourceSize.width: width
                        sourceSize.height: height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                }

                ColorOverlay{
                    anchors.fill: iconWeather
                    source: iconWeather
                    color: launchermodular.settings.textColor
                }

                Text {
                    anchors.top: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#E95420"

                    text: if (launchermodular.settings.unitsFormat == "&units=imperial") { "<font color=\""+launchermodular.settings.textColor+"\">"+launchermodular.settings.cityName.split(",")[0]+"</font> "+temp.split(".")[0]+"°F";}else{ "<font color=\""+launchermodular.settings.textColor+"\">"+launchermodular.settings.cityName.split(",")[0]+"</font> "+temp.split(".")[0]+"°C";}
                }
                }

        }

        }

        ListView {
            id: listViewDetailWeather
            visible: false
            width: units.gu(16)
            height: units.gu(20)
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            model: modelWeather

            delegate: Component {
                Rectangle {
                    color: "transparent"
                    width: units.gu(16)
                    height: units.gu(20)
                    visible: index == 0

                Image {
                        id: iconDetailWeather
                        anchors.top: parent.top
                        source: "weather/assets/"+icon+".svg"
                        width: units.gu(10)
                        height: units.gu(10)
                        sourceSize.width: width
                        sourceSize.height: height
                        anchors.horizontalCenter: parent.horizontalCenter
                }

                ColorOverlay{
                    anchors.fill: iconDetailWeather
                    source: iconDetailWeather
                    color: launchermodular.settings.textColor
                }

                Text {
                    id: cityDetailWeather
                    anchors.top: iconDetailWeather.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#E95420"

                    text: if (launchermodular.settings.unitsFormat == "&units=imperial") { launchermodular.settings.cityName.split(",")[0]+" "+temp.split(".")[0]+"°F";}else{ launchermodular.settings.cityName.split(",")[0]+" "+temp.split(".")[0]+"°C";}

                }
                Text {
                    id: descDetailWeather
                    anchors.top: cityDetailWeather.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: launchermodular.settings.textColor

                    text: desc
                }
                Text {
                    id: windDetailWeather
                    anchors.top: descDetailWeather.bottom
                    color: launchermodular.settings.textColor
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: {
                      if (launchermodular.settings.unitsFormat == "&units=imperial"){
                        if (windspeed >= 0 && windspeed <= 0.2) {
                            return i18n.tr("Calm")+" "+windspeed+" mph";
                        } else if (windspeed >= 0.3 && windspeed <= 1.59) {
                            return i18n.tr("Light Air")+" "+windspeed+" mph";
                        } else if (windspeed >= 1.6 && windspeed <= 3.39) {
                            return i18n.tr("Light Breeze")+" "+windspeed+" mph";
                        } else if (windspeed >= 3.4 && windspeed <= 5.49) {
                            return i18n.tr("Gentle Breeze")+" "+windspeed+" mph";
                        } else if (windspeed >= 5.5 && windspeed <= 7.99) {
                            return i18n.tr("Moderate Breeze")+" "+windspeed+" mph";
                        } else if (windspeed >= 8.0 && windspeed <= 10.79) {
                            return i18n.tr("Fresh Breeze")+" "+windspeed+" mph";
                        } else if (windspeed >= 10.8 && windspeed <= 13.89) {
                            return i18n.tr("Strong Breeze")+" "+windspeed+" mph";
                        } else if (windspeed >= 13.9 && windspeed <= 17.19) {
                            return i18n.tr("Near Gale")+" "+windspeed+" mph";
                        } else if (windspeed >= 17.2 && windspeed <= 20.79) {
                            return i18n.tr("Gale")+" "+windspeed+" mph";
                        } else if (windspeed >= 20.8 && windspeed <= 24.49) {
                            return i18n.tr("Severe Gale")+" "+windspeed+" mph";
                        } else if (windspeed >= 24.5 && windspeed <= 28.49) {
                            return i18n.tr("Strong storm")+" "+windspeed+" mph";
                        } else if (windspeed >= 28.5 && windspeed <= 32.69) {
                            return i18n.tr("Violent Storm")+" "+windspeed+" mph";
                        } else if (windspeed >= 32.7) {
                            return i18n.tr("Hurricane")+" "+windspeed+" mph";
                        }
                      }else{
                        if (windspeed >= 0 && windspeed <= 1) {
                            return i18n.tr("Calm")+" "+windspeed+" km/h";
                        } else if (windspeed >= 1 && windspeed <= 3) {
                            return i18n.tr("Light Air")+" "+windspeed+" km/h";
                        } else if (windspeed >= 3.1 && windspeed <= 7) {
                            return i18n.tr("Light Breeze")+" "+windspeed+" km/h";
                        } else if (windspeed >= 7.1 && windspeed <= 12) {
                            return i18n.tr("Gentle Breeze")+" "+windspeed+" km/h";
                        } else if (windspeed >= 12.1 && windspeed <= 17) {
                            return i18n.tr("Moderate Breeze")+" "+windspeed+" km/h";
                        } else if (windspeed >= 17.1 && windspeed <= 24) {
                            return i18n.tr("Fresh Breeze")+" "+windspeed+" km/h";
                        } else if (windspeed >= 24.1 && windspeed <= 30) {
                            return i18n.tr("Strong Breeze")+" "+windspeed+" km/h";
                        } else if (windspeed >= 30.1 && windspeed <= 38) {
                            return i18n.tr("Near Gale")+" "+windspeed+" km/h";
                        } else if (windspeed >= 38.1 && windspeed <= 46) {
                            return i18n.tr("Gale")+" "+windspeed+" km/h";
                        } else if (windspeed >= 46.1 && windspeed <= 54) {
                            return i18n.tr("Severe Gale")+" "+windspeed+" km/h";
                        } else if (windspeed >= 54.1 && windspeed <= 63) {
                            return i18n.tr("Strong storm")+" "+windspeed+" km/h";
                        } else if (windspeed >= 63.1 && windspeed <= 73) {
                            return i18n.tr("Violent Storm")+" "+windspeed+" km/h";
                        } else if (windspeed >= 73.1) {
                            return i18n.tr("Hurricane")+" "+windspeed+" km/h";
                        }
                      }
                    }
                }
                Text {
                    id: winddirDetailWeather
                    anchors.top: windDetailWeather.bottom
                    color: launchermodular.settings.textColor
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: {
                    if (winddir == "N") {
                        return i18n.tr("of")+" "+i18n.tr("North");
                    } else if (winddir == "NNE") {
                        return i18n.tr("of")+" "+i18n.tr("North-Northeast");
                    } else if (winddir == "NE") {
                        return i18n.tr("of")+" "+i18n.tr("Northeast");
                    } else if (winddir == "ENE") {
                        return i18n.tr("of")+" "+i18n.tr("East-Northeast");
                    } else if (winddir == "E") {
                        return i18n.tr("of")+" "+i18n.tr("East");
                    } else if (winddir == "ESE") {
                        return i18n.tr("of")+" "+i18n.tr("East-Southeast");
                    } else if (winddir == "SE") {
                        return i18n.tr("of")+" "+i18n.tr("Southeast");
                    } else if (winddir == "SSE") {
                        return i18n.tr("of")+" "+i18n.tr("South-Southeast");
                    } else if (winddir == "S") {
                        return i18n.tr("of")+" "+i18n.tr("South");
                    } else if (winddir == "SSW") {
                        return i18n.tr("of")+" "+i18n.tr("South-Southwest");
                    } else if (winddir == "SW") {
                        return i18n.tr("of")+" "+i18n.tr("Southwest");
                    } else if (winddir == "WSW") {
                        return i18n.tr("of")+" "+i18n.tr("West-Southwest");
                    } else if (winddir == "W") {
                        return i18n.tr("of")+" "+i18n.tr("West");
                    } else if (winddir == "WNW") {
                        return i18n.tr("of")+" "+i18n.tr("West-Northwest");
                    } else if (winddir == "NW") {
                        return i18n.tr("of")+" "+i18n.tr("Northwest");
                    } else if (winddir == "NNW") {
                        return i18n.tr("of")+" "+i18n.tr("North-Northwest");
                    } else if (winddir == "") {
                        return "";
                    }
                  }
                }
                Text {
                    id: humidityDetailWeather
                    anchors.top: winddirDetailWeather.bottom
                    color: launchermodular.settings.textColor
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: humidityvalue+humidityunit+" "+i18n.tr("humidity")
                }

                }

        }

        }



        }

        XmlListModel {
            id: modelWeatherNext
            source: "http://api.openweathermap.org/data/2.5/forecast?q="+launchermodular.settings.cityName+launchermodular.settings.unitsFormat+"&lang="+Qt.locale().name.split("_")[0]+"&mode=xml&appid="+launchermodular.settings.apiOpenWeatherMap;
            query: "/weatherdata/forecast/time"

            XmlRole { name: "iconnext"; query: "symbol/string(@var)" }
            XmlRole { name: "timefrom"; query: "string(@from)" }

            XmlRole { name: "icon"; query: "symbol/string(@var)" }
            XmlRole { name: "desc"; query: "symbol/string(@name)" }
            XmlRole { name: "temp"; query: "temperature/string(@value)" }
            XmlRole { name: "windspeed"; query: "windSpeed/string(@mps)" }
            XmlRole { name: "winddir"; query: "windDirection/string(@code)" }
            XmlRole { name: "humidityvalue"; query: "humidity/string(@value)" }
            XmlRole { name: "humidityunit"; query: "humidity/string(@unit)" }

        }

        ListView {
            id: nextWeather
            model: modelWeatherNext
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: units.gu(2)
            anchors.horizontalCenter: parent.horizontalCenter
            height: units.gu(2)
            width: contentWidth
            orientation: ListView.Horizontal
            delegate: Rectangle {
                color: "transparent"
                height: units.gu(2)
                visible: if (Qt.formatDateTime(new Date(), "d M yyyy" ) != Qt.formatDateTime(timefrom, "d M yyyy" ) && "12:00" == Qt.formatDateTime(timefrom, "HH:mm")){true}else{false}
                width: if (visible){units.gu(2)}else{units.gu(0)}

            Image {
                    id: iconWeather
                    source: "weather/assets/"+iconnext+".svg"
                    width: parent.width
                    height: parent.height
                    sourceSize.width: width
                    sourceSize.height: height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
            }

            ColorOverlay{
                anchors.fill: iconWeather
                source: iconWeather
                color: launchermodular.settings.textColor
            }
          }
        }



    MouseArea {
        anchors.fill: parent
            onClicked:{ if (listViewWeather.visible == true){
                                listViewDetailWeather.visible = true;
                                listViewWeather.visible = false;
                                modelWeatherNext.reload();
                                nextWeather.visible = true;
                                }else{
                                listViewDetailWeather.visible = false;
                                nextWeather.visible = false;
                                listViewWeather.visible = true;} }
            onPressAndHold: {
                pageStack.push(Qt.resolvedUrl("weather/Settings.qml"))
            } // pressAndHold
    }
}
