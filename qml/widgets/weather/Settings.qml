import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3 as ListItem

Page {
    id: widgetSettingsWeather

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings for weather widget");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        pageStack.pop();
                    }
                }
            ]
   }

Rectangle {
    id:mainsettings
        anchors.fill: parent
        color: "#111111"
        anchors.topMargin: units.gu(6)


    Flickable {
        id: flickableSettings
        anchors.fill: parent
        contentHeight: settingsColumn.height
        flickableDirection: Flickable.VerticalFlick
        clip: true


        Column {
            id: settingsColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                rightMargin: units.gu(2)
                leftMargin: units.gu(2)
            }



Item {
    id: templateRow
    width: parent.width
    anchors.top: parent.top
    height: units.gu(4)
    anchors.topMargin: units.gu(2)

    Label {
        id: label
        text: i18n.tr("API Key")
        color:  "white"
        width: templateRow.titleWidth
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        elide: Text.ElideRight
        font.weight: Font.Light
    }

    Row {
        id: contentRow
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: label.right
        anchors.leftMargin: units.gu(2)
        anchors.right: parent.right
        spacing: units.gu(2)

            TextField {
                objectName: "textfield_standard"
                placeholderText: i18n.tr("OpenWeatherMap API")
                width: parent.width
                text: launchermodular.settings.apiOpenWeatherMap
                onTextChanged: { launchermodular.settings.apiOpenWeatherMap = text }
                inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
            }
    }
}
            Label {
                id: textAPI
                anchors.topMargin: units.gu(2)
                anchors.top: templateRow.bottom
                text: i18n.tr("Click to sign up for an API key")
                color: "yellow"

                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally('https://openweathermap.org/appid')
                }
            }



Item {
    id: templateRow2
    width: parent.width
    anchors.top: textAPI.bottom
    height: units.gu(4)
    anchors.topMargin: units.gu(2)

    Label {
        id: labelCity
        text: i18n.tr("City name")
        color:  "white"
        width: templateRow2.titleWidth
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        elide: Text.ElideRight
        font.weight: Font.Light
    }

    Row {
        id: contentRow2
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: labelCity.right
        anchors.leftMargin: units.gu(2)
        anchors.right: parent.right
        spacing: units.gu(2)

            TextField {
                objectName: "textfield_standard"
                placeholderText: "London,uk "+i18n.tr("or")+" Paris,fr "+i18n.tr("or")+" New York,us …"
                width: parent.width
                text: launchermodular.settings.cityName
                onTextChanged: { launchermodular.settings.cityName = text }
            }
    }
}



    ListItem.ItemSelector {
        id: list
	anchors.top: templateRow2.bottom
	anchors.topMargin: units.gu(2)
        model: customModel
        delegate: selectorDelegate
	onSelectedIndexChanged:  {
		launchermodular.settings.unitsFormat = model.get(selectedIndex).url
	}
	Component.onCompleted: {
		while (model.get(selectedIndex).url != launchermodular.settings.unitsFormat && selectedIndex < model.count)
			selectedIndex = selectedIndex+1
	}
    }
    Component {
        id: selectorDelegate
        OptionSelectorDelegate { text: name; subText: description}
    }
    ListModel {
        id: customModel
        ListElement { name: "<font color=\"#ffffff\">°F</font>"; description: "<font color=\"#ffffff\">Fahrenheit</font>"; url:"&units=imperial" }
        ListElement { name: "<font color=\"#ffffff\">°C</font>"; description: "<font color=\"#ffffff\">Celsius</font>"; url:"&units=metric" }
    }


        } // column
    } //flickable
 } //rectangle settings

}
