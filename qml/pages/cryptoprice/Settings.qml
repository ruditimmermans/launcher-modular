import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtQuick.LocalStorage 2.0
import "storage.js" as Storage
        
Page {
    id: aboutPage

    property int pageIndex

    header: PageHeader {
        id: headerSettings
        title: i18n.tr("Settings Page");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        launchermodular.pageModel.remove(aboutPage.pageIndex);
                        launchermodular.pageModel.insert(aboutPage.pageIndex,{"name": "Cryptoprice.qml", "icon": "pages/cryptoprice/assets/icon.svg", "data": {}, "directory": "pages/"})
                        launchermodular.settings.page = launchermodular.getPageArray();
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
        anchors.fill: parent
        contentHeight: configuration.childrenRect.height

        Column {
            id: configuration
            anchors.fill: parent

            
            ListItem.Standard {
                text: "<font color=\"#ffffff\">"+i18n.tr("Automatic Updates every 5 seconds?")+"</font>"
                enabled: true
                control: Switch {
                    id: enableAutomaticUpdates
                    checked:  if(Storage.get("automaticRefresh", "auto") === "auto"){true}else{false}
                        onClicked: if(Storage.get("automaticRefresh", "auto")==="auto"){Storage.set("automaticRefresh", "manual")}else{Storage.set("automaticRefresh", "auto")}
                }
            }

            ListItem.Standard {
                text: "<font color=\"#ffffff\">"+i18n.tr("Your currency?")+"</font>"
                enabled: true
                control: ComboBox {
                            id: currency
                            height: units.gu(5)
                            width: units.gu(20)
                            currentIndex: Storage.get("currentIndex", 1)
                            textRole: "text"
                            model: ListModel {
                                id: currencyModel
                                ListElement { text: "CHF";  symbol: "SFr."; position: "right" }
                                ListElement { text: "EUR";  symbol: "€"; position: "right" }
                                ListElement { text: "GBP";  symbol: "£"; position: "left" }
                                ListElement { text: "ISK";  symbol: "Kr"; position: "right" }
                                ListElement { text: "USD";  symbol: "$"; position: "left" }
                            }
                            onCurrentIndexChanged: {
                                Storage.set("currentIndex", currency.currentIndex)
                                Storage.set("userCurrency", currencyModel.get(currentIndex).text)
                                Storage.set("userCurrencySymbol", currencyModel.get(currentIndex).symbol)
                                Storage.set("userCurrencySymbolPosition", currencyModel.get(currentIndex).position)
                            }
                            
                        }
            }

        }   
    }
}

}