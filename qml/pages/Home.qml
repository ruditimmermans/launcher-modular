import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import MySettings 1.0
import AppHandler 1.0
import Terminalaccess 1.0
import "../widgets"
import QtQuick.Controls 2.2
import Ubuntu.Components.Popups 1.3

Item {
        id: home

Component {
	id: diag
 Dialog {
	id: popup
	title: "Authentification needed"
	TextField {
		id:inp
		placeholderText: "Enter password (by defaut : phablet)"
		echoMode: TextInput.Password
	}
	Button {
		text:"ok"
		onClicked: {Terminalaccess.inputLine(inp.text, false);PopupUtils.close(popup)}
	}
 }
}
 Timer {
	id:refreshafteruninstall
        interval: 500; running: false; repeat: false
        onTriggered: {home.getIcon();}
    }
Connections {
	target: Terminalaccess
	onNeedSudoPassword: {PopupUtils.open(diag)}
	onFinished: {
			console.log("signal on finished");
			refreshafteruninstall.restart()
	}
}

    property bool reloading: false
        
	function getIcon()
    {
       home.reloading = true
       AppHandler.reload()
       AppHandler.permaFilter()
       AppHandler.permaFilter("NoDisplay", "^(?!true$).*$") //keep the one that have NOT NoDisplay=true
       AppHandler.permaFilter("package_name",  "^(?!launchermodular.ubuntouchfr_).*$")
       AppHandler.permaFilter("Icon",  "/.*$")
        listCustomIcon.model = ""
        listCustomIcon.model = launchermodular.customIconModel
       //AppHandler.appsinfo.push(settingsButton)
       AppHandler.sort()
           //AppHandler.setFav(settings.coreApps.join())
       home.reloading = false
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: listColumn.childrenRect.height+units.gu(2)
        flickableDirection: Flickable.VerticalFlick
        clip: true
        maximumFlickVelocity : units.gu(10)*100
        flickDeceleration: 2500

        Behavior on contentY{
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }
            
       PullToRefresh {
            parent: flickable
            refreshing: home.reloading
            onRefresh: home.getIcon();

        } 
      
        
            Column {
                id: listColumn
                anchors.fill: parent
                anchors {
                    topMargin: units.gu(2)
                }
                spacing: units.gu(2)
                

            Rectangle {
            id: search
            height: units.gu(5)
            width: parent.width
                
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }
            color: "transparent"

            Rectangle {
                id: colorSearch
                color: launchermodular.settings.backgroundColor
                radius: units.gu(1)
                opacity: 0.3
                anchors.fill: parent
            }
            Icon {
                id: iconSearch
                anchors {
                    left: search.left
                    rightMargin: units.gu(1)
                    leftMargin: units.gu(1)
                }
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height*0.5
                width: height
                name: {
                    if(searchField.text.length > 0){
                        "edit-clear"
                    }else{
                        "find"
                    }
                }
                MouseArea {
                    anchors.fill: parent
                        onClicked:{
                            if(searchField.text.length > 0){
                               searchField.text = ""
                               searchField.focus = false 
                            }                                       
                        }
                }
            }
            TextField {
                id: searchField
                anchors {
                    left: iconSearch.right
                    right: iconWebSearch.left
                }
                height: search.height
                color: launchermodular.settings.textColor
                    background: Rectangle {
                                            height: parent.height
                                            color: "transparent"
                                          }

                placeholderText: i18n.tr("Search your phone and online sources")
                inputMethodHints: Qt.ImhNoPredictiveText
                onVisibleChanged: {
                    if (visible) {
                        forceActiveFocus()
                    }
                }
                onTextChanged: {
                    AppHandler.resetTempFilter()
                    if(text.length > 0){
                        iconWebSearch.visible = true
                        AppHandler.tempFilter("Name;Name[];package_name", text)
                        rowWidgets.visible = false
                        rowWidgetsM.visible = false
                    }else{
                        iconWebSearch.visible = false
                        AppHandler.resetTempFilter()
                        AppHandler.sort()
                        rowWidgets.visible = true
                        rowWidgetsM.visible = true
                    }
                }
            }

            Icon {
                id: iconWebSearch
                visible: false
                anchors {
                    right: search.right
                    rightMargin: units.gu(1)
                    leftMargin: units.gu(1)
                }
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height*0.5
                width: height
                source: "home/assets/websearch.svg"
                MouseArea {
                    anchors.fill: parent
                        onClicked:{
                                if(searchField.text.toLowerCase().startsWith("http://") || searchField.text.toLowerCase().startsWith("https://")) {
                                    Qt.openUrlExternally( searchField.text.toLowerCase() );
                                }else{
                                    Qt.openUrlExternally( "https://duckduckgo.com/?q="+searchField.text.toLowerCase()+"&t=h_&ia=web" );
                                }

                         }
                }
            }

        }
                
                
                Row{
                    id: rowWidgets
                    width: childrenRect.width
                    height: contentHeight
                    anchors.horizontalCenter: parent.horizontalCenter
   
                        Clock { 
                            visible: launchermodular.settings.widgetVisibleClock
                            width: launchermodular.settings.widgetVisibleWeather ? listColumn.width/2 : listColumn.width
                        }
                        Weather { visible: launchermodular.settings.widgetVisibleWeather }
                    
                }
                
                Row{
                    id: rowWidgetsM
                    width: parent.width
                    height: contentHeight
                    anchors {
                        right: parent.right
                        rightMargin: units.gu(2)
                        left: parent.left
                        leftMargin: units.gu(2)
                    }
                    
                    Column{
                        id: widgetLM
                        spacing: units.gu(1)
                        width: contentWidth

                            Alarm { visible: launchermodular.settings.widgetVisibleAlarm }
                            Lastcall { visible: launchermodular.settings.widgetVisibleLastcall }
                            Lastmessage { visible: launchermodular.settings.widgetVisibleLastmessage }

                    }
                    
                    Event { visible: launchermodular.settings.widgetVisibleEvent }
                
                }
                
                FavoriteApp {
                    id: favoriteAppWidget
                    width: parent.width                
                }
                
                FavoriteContact {
                    id: favoriteContactWidget
                    width: parent.width      
                }
                
                SearchContact {
                    id: searchContactWidget
                    width: parent.width     
                }
                
                Item{
                    id: titleList
                    height: units.gu(4)
                    width: parent.width
                    anchors {
                        left: parent.left
                        leftMargin: units.gu(2)
                    }
                    
                    Icon {
                       id: iconInstalledApps
                        width: units.gu(2)
                        height: units.gu(2)
                        name: "keypad"
                        color: launchermodular.settings.textColor
                    }
                    Label {
                        id: titleListApps
                        anchors.left: iconInstalledApps.right
                        anchors.leftMargin: units.gu(1)
                        text: i18n.tr("Installed Apps")
                        color: launchermodular.settings.textColor
                    }
                }
               
                
                
                
                Item {
                    id: listColumnApps
                    width: parent.width
                    height: gview.contentHeight                
                    anchors {
                        left: parent.left
                        leftMargin: units.gu(2)
                        right: parent.right
                        rightMargin: units.gu(2)
                    }
                
                    function doAction(action) {
                        console.log("opening "+action)
                        if(action.startsWith("application:///")) {
                            Qt.openUrlExternally(action);
                        }
                        if(action.startsWith("terminal:///")) {
                         var actionterm = action.replace(/^terminal:\/\/\//, "")
                         var actionsudo = actionterm.replace(/^sudo /, "sudo -S ")                               
                                                         
                        Terminalaccess.run(actionsudo);
                        }
                        if(action.startsWith("browser:///")) {

                               Qt.openUrlExternally(action.replace(/^browser:\/\/\//, ""));
                        }
                        if(action.startsWith("internal:///")) {
                            pageStack.push(Qt.resolvedUrl(action.replace(/^internal:\/\/\//, "")))
                        }
                    }


    GridView {
        id: gview
        anchors.fill: parent

        cellHeight: iconbasesize+units.gu(5)
        property real iconbasesize: units.gu(10)*launchermodular.settings.iconSize
        cellWidth: Math.floor(width/Math.floor(width/iconbasesize))
            
        focus: true
        model: AppHandler.appsinfo.length
        interactive: false
            
        delegate: Item {
                    width: gview.cellWidth

                    height: gview.iconbasesize


                    property var elem: AppHandler.appsinfo[index]

                    Item {
                        id: itemApp
                        width: units.gu(8)*launchermodular.settings.iconSize
                        height: units.gu(8)*launchermodular.settings.iconSize
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            id: imgIcons
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: parent.height
                            source:elem.icon;
                            visible: if (launchermodular.settings.iconStyle == "none") { true;}else{ false;}
                        }

                        OpacityMask {
                            anchors.fill: imgIcons
                            source: launchermodular.settings.iconStyle == "rounded" ? imgIcons : undefined
                            maskSource: Rectangle {
                                width: imgIcons.width
                                height: imgIcons.height
                                radius: units.gu(8)
                                color: if (launchermodular.settings.iconStyle == "rounded") { "";}else{ "transparent";}
                                visible: if (launchermodular.settings.iconStyle == "rounded") { false;}else{ true;}
                            }
                        }                      

                        UbuntuShape {
                            source: imgIcons
                            aspect: UbuntuShape.Flat
                            width: if (launchermodular.settings.iconStyle == "default") { parent.width;}else{ units.gu(0);}
                            height: if (launchermodular.settings.iconStyle == "default") { parent.height;}else{ units.gu(0);}
                            radius : "medium"
                        }



                       Component {
                            id: appsDialog
                            Dialog {
                                id: appsDialogue

                                title: elem.name
                                text: elem.getProp("Comment")


                                Item {
                                    height: units.gu(5)
                                    width: parent.width
                                    Button {
                                        anchors.left: parent.left
                                        id: uninstallButton
                                        text: elem.getProp("package_name") ? i18n.tr("Uninstall") : i18n.tr("Remove")
                                        height: units.gu(4)
                                        width: (parent.width/2)-units.gu(2)
                                        contentItem: Text {
                                            text: uninstallButton.text
                                            font: uninstallButton.font
                                            color: "#ffffff"
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                        }

                                        background: Rectangle {
                                            radius: units.gu(1.5)
                                            color: UbuntuColors.green
                                        }
                                        onClicked: {
                                            PopupUtils.close(appsDialogue);
                                            
                                            if(elem.getProp("package_name")){Terminalaccess.run("sudo -S click unregister --user=phablet "+elem.getProp("package_name").split("_")[0])}else{
                                           
    for (var i = 0; i < launchermodular.customIconModel.count; i++) {
        if (elem.name === launchermodular.customIconModel.get(i).name) {
            launchermodular.customIconModel.remove(i)
            launchermodular.getCustomIconArray()

        }
    }
        launchermodular.settings.customIcon = launchermodular.getCustomIconArray();

                                            }
                                            
                                            home.getIcon()
						
                                            }
                                    }
                                    Button{
                                        anchors.right: parent.right
                                        text: i18n.tr("Cancel")
                                        height: units.gu(4)
                                        width: (parent.width/2)-units.gu(2)
                                        background: Rectangle {
                                            radius: units.gu(1.5)
                                            color: UbuntuColors.orange
                                        }
                                        onClicked: {
                                            onClicked: PopupUtils.close(appsDialogue);
                                        }
                                    }


                                }

                            }
                        }

                        // application:///$(app_id).desktop
                        MouseArea {
                            anchors.fill: parent
                                onClicked: {
                                    listColumnApps.doAction(elem.action)
                                }
                                onPressAndHold: {
                                    PopupUtils.open(appsDialog);
                                } // pressAndHold
                        }
                                        

                    } // Item
            
                        Text{
                            anchors.top: itemApp.bottom
                            horizontalAlignment: Text.AlignHCenter
                            anchors.topMargin: units.gu(1)
                            width: parent.width
                            font.pixelSize: units.gu(1.5)
                            wrapMode: Text.Wrap
                            text: elem.name;
                            color: launchermodular.settings.textColor
                         }
            
            }// delegate

        }
                
    Repeater {
        id: listCustomIcon 
        model: launchermodular.customIconModel
        Loader {
              
            AppInfo {
		      id: customButton
                name: model.name
                action: model.action
                icon: model.icon === "../assets/placeholder-app-icon.svg" ? "../../assets/placeholder-app-icon.svg" : model.icon

            Component.onCompleted:AppHandler.appsinfo.push(customButton)
	       }                
			
        }

    }
                        
        Component.onCompleted: {
            console.log(AppHandler.appsinfo.length);
            AppHandler.permaFilter()
            AppHandler.permaFilter("NoDisplay", "^(?!true$).*$") //keep the one that have NOT NoDisplay=true
            AppHandler.permaFilter("package_name",  "^(?!launchermodular.ubuntouchfr_).*$")
            AppHandler.permaFilter("Icon",  "/.*$")                
            
            //AppHandler.appsinfo.push(settingsButton)
                            
            AppHandler.sort()
            //console.log(AppHandler.appsinfo[0].name);
            //console.log(AppHandler.appsinfo[0].getProp("package_name"));
            //console.log(AppHandler.appsinfo[0].getProp("Icon"));
            //console.log(Qt.locale().name); 
            
        }
    }
            
            
            
            
                
            }//Column
        } //Flickable

}
