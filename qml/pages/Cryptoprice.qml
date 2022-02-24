import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import "../components"
import QtQuick.LocalStorage 2.0
import "cryptoprice/storage.js" as Storage
    
Item {
    id: cryptopricePage

        
    Timer {
        id: timer
        interval: 6000
        repeat: if(Storage.get("automaticRefresh", "auto") === "auto"){true}else{false}
        running: if(Storage.get("automaticRefresh", "auto") === "auto"){true}else{false}

        onTriggered:{
            jsonlist.source = ""
            jsonlist.source = "https://api.coinbase.com/v2/prices/"+Storage.get("userCurrency", "EUR")+"/spot"
        }
    }       
    
    property bool reloading: false

	function refreshcryptoprice()
    {
            cryptopricePage.reloading = true
            jsonlist.source = ""
            jsonlist.source = "https://api.coinbase.com/v2/prices/"+Storage.get("userCurrency", "EUR")+"/spot"
            cryptopricePage.reloading = false
    }
    

                
        JSONListModel {
            id: jsonlist
            source: "https://api.coinbase.com/v2/prices/"+Storage.get("userCurrency", "EUR")+"/spot"
            query: "$.data[*]"
        }                
                
       ListView {
            id: listPrice
            anchors.fill: parent
            anchors.top: parent.top
            anchors.topMargin: units.gu(3)
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            model: jsonlist.model

                
        PullToRefresh {
            parent: listPrice
            refreshing: cryptopricePage.reloading
            onRefresh: cryptopricePage.refreshcryptoprice();
        } 
           
            delegate: ListItem {
                height: layout.height + (divider.visible ? divider.height : 0)
                divider.visible: false
                    
                ListItemLayout {
                    id: layout
                        
                    property var amountFormated: Math.round(model.amount * 100) / 100;

                    Image {
                        source: "cryptoprice/assets/"+model.base+".svg"
                        SlotsLayout.position: SlotsLayout.Leading 
                        width: units.gu(5)
                        height: units.gu(5)
                    }
                    title.text: Storage.get("userCurrencySymbol", "€")+" "+amountFormated
                    title.color: launchermodular.settings.textColor


                }
                

            }

        }
                
                
                
                
            
        
}
              
