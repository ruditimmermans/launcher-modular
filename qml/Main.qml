import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import MySettings 1.0
import AppHandler 1.0
import "pages"
import QtQuick.Controls 2.2
import Ubuntu.Components.Popups 1.3
import AccountsService 0.1
    
MainView {
    id: launchermodular
    objectName: 'mainView'
    applicationName: 'launchermodular.ubuntouchfr'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)
    
    property string appVersion : "1.6.0"
        
    function getCustomIconArray() {
        var customIcon = [], hMI_l = launchermodular.customIconModel.count;
        for (var i=0; i<hMI_l; i++){
            var itemIcon = launchermodular.customIconModel.get(i);
            customIcon.push({"name": itemIcon.name, "icon": itemIcon.icon, "action": itemIcon.action});
        }

        console.log("customIconModel to array, size : "+customIcon.length);
        return customIcon;
    }

    property ListModel customIconModel :  ListModel { id: customIconModel }
    
        
    function getPageArray() {
        var page = [], hM_l = launchermodular.pageModel.count;
        for (var i=0; i<hM_l; i++){
            var item = launchermodular.pageModel.get(i);
            page.push({"name": item.name, "icon": item.icon, "data":item.data, "directory":item.directory});
        }

        console.log("pageModel to array, size : "+page.length);
        return page;
    }
    
  
    
    property ListModel pageModel :  ListModel { id: pageModel }

    function getFavoriteAppsArray() {
        var favoriteApps = [], hMA_l = launchermodular.favoriteAppsModel.count;
        for (var i=0; i<hMA_l; i++){
            var itemApps = launchermodular.favoriteAppsModel.get(i);
            favoriteApps.push({"name": itemApps.name, "icon": itemApps.icon, "action": itemApps.action});
        }

        console.log("favoriteAppsModel to array, size : "+favoriteApps.length);
        return favoriteApps;
    }

    property ListModel favoriteAppsModel :  ListModel { id: favoriteAppsModel }

    
    // persistent app settings:
    property var settings: Settings {

        property bool firstRun: true
        property bool firstRunNew: true
        property bool developerModeEnabled:	false;

        property string apiOpenWeatherMap: ''
        property string unitsFormat: '&units=imperial'
        property string cityName: ''

        property string formatHours: '24h'
        property string backgroundAnalogHours: ''

        property string iconStyle: 'rounded'
        property string iconSize: '0.866525720666956'

        property string textColor: '#FFFFFF'
        property string backgroundColor: '#000000'
        property string backgroundOpacity: '0.7'
        property string backgroundBlur: '0'
        
        property string folderimage: '/home/phablet/Pictures/'

        property int limiteDaysCalendar: 31;
        property int limiteDaysWidgetEvent: 31;
        property int limiteItemWidgetEvent: 5;

        property var page;
        property var customIcon;
        property var favoriteApps;
        
        property var selectedAppNews: [];
	signal newsConfigChanged();
                  
        property bool newsBackgroundOpacity: false
        property string widgetMessageClick: 'default'
        property bool widgetMessageSummary: true
        property string widgetCallClick: 'default'
        property string widgetFavoriteContactClick: 'tel'
            
        property bool widgetVisibleClock: true
        property bool widgetVisibleWeather: true
        property bool widgetVisibleAlarm: true
        property bool widgetVisibleLastcall: true
        property bool widgetVisibleLastmessage: true
        property bool widgetVisibleEvent: true

	
    }//settings

    property variant datenow: new Date()
    property var iconCustomUrl: "../assets/placeholder-app-icon.svg"
        
    Timer {
        id: clockUpdater
        interval: 60000-(launchermodular.datenow.getSeconds()*1000)
        running: true
        repeat: true
        onTriggered: {
            if(clockUpdater.interval != 60000){clockUpdater.interval = 60000}
            launchermodular.datenow = new Date()
        }
    }
    
    
PageStack {
  id: pageStack
    Page {
        id: pageLauncher
        anchors.fill: parent


        Component.onCompleted: {
            if(launchermodular.settings.firstRunNew){
                launchermodular.settings.page = undefined
                launchermodular.settings.firstRunNew = false
            }

            console.log("###### on Component completion #####")
                
            if(typeof launchermodular.settings.customIcon === 'undefined') {
                 launchermodular.settings.customIcon = [];
            }
            console.log("Retrieve custom icon with : "+ launchermodular.settings.customIcon.length +" elemets");
            var customIcon_l = launchermodular.settings.customIcon.length
            for (var i=0; i<customIcon_l; i++){
                var item = launchermodular.settings.customIcon[i];
                launchermodular.customIconModel.insert(i,{"name": item.name, "icon": item.icon, "action": item.action})
            }
            

                
            if(typeof launchermodular.settings.favoriteApps === 'undefined') {
                 launchermodular.settings.favoriteApps = [];
            }
            console.log("Retrieve Favorite Apps with : "+ launchermodular.settings.favoriteApps.length +" elemets");
            var favoriteApps_l = launchermodular.settings.favoriteApps.length
            for (var i=0; i<favoriteApps_l; i++){
                var itemApps = launchermodular.settings.favoriteApps[i];
                launchermodular.favoriteAppsModel.insert(i,{"name": itemApps.name, "icon": itemApps.icon, "action": itemApps.action})
            }
        
                
            if(typeof launchermodular.settings.page === 'undefined') {
                console.log("page is undefined, let's create a new one");
                launchermodular.settings.page = [{"name": "Home.qml", "icon": "pages/home/assets/icon.svg","data":{}, "directory": "pages/"}];
            }
            console.log("Retrieve page with : "+ launchermodular.settings.page.length +" elemets");
            var page_l = launchermodular.settings.page.length
            for (var i=0; i<page_l; i++){
                var item = launchermodular.settings.page[i];
                launchermodular.pageModel.insert(i,{"name": item.name, "icon": item.icon, "data":item.data, "directory":item.directory})
            }
        
        }
        Component.onDestruction: {
            console.log("####### On component destruction ###### ");
            launchermodular.settings.page = getPageArray();
            console.log("Store page with : "+ launchermodular.settings.page.length +" elemets");

            launchermodular.settings.customIcon = getCustomIconArray();
            console.log("Store customIcon with : "+ launchermodular.settings.customIcon.length +" elemets");
            
            launchermodular.settings.favoriteApps = getFavoriteAppsArray();
            console.log("Store favoriteApps with : "+ launchermodular.settings.favoriteApps.length +" elemets");

        }

        header: PageHeader {
            id: header
            visible: false
        }
            
    
            Rectangle {
                id: topBorder
                height: units.gu(0.1)
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#E95420"
            }

        Rectangle {
            id: background
            anchors {
                left: parent.left
                right: parent.right
                top: topBorder.bottom
                bottom: bottomBarLayout.top
            }

            Image {
                id: backgroundblur
                anchors.fill: parent;
                source: AccountsService.backgroundFile //unconfined MySettings.getBackgroundFile() ? MySettings.getBackgroundFile() : "../assets/wallpaper.png"
                smooth: true
                fillMode: Image.PreserveAspectCrop
                visible: false
            }

    FastBlur {
        anchors.fill: backgroundblur
        source: backgroundblur
        radius: launchermodular.settings.backgroundBlur
    }
            Rectangle {
            id: listAppBackground
            anchors.fill: parent
            color: launchermodular.settings.backgroundColor
            opacity: launchermodular.settings.backgroundOpacity
            }

            Rectangle {
                id: listApp
                anchors.fill: parent
                color: "transparent"

/* ******************************** LES PAGES COMMENCE ICI ******************************** */




                SwipeView {
                    id: view

                    currentIndex: 0
                    anchors.fill: parent

    Repeater {
        model: launchermodular.pageModel
        Loader {
                sourceComponent:{
                    Qt.createComponent(directory+name)
                }
	    property int pageIndex:index
			
        }
    }

                }


/* ******************************** FIN DES PAGES ******************************** */


            }
        }

/* ******************************** DEBUT DE LA BARRE EN BAS ******************************** */

        Rectangle {
            id: bottomBarLayout
            color: "#111111"
            height: units.gu(5)

            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Rectangle {
                id: borderTop
                height: units.gu(0.1)
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#E95420"
            }

MouseArea {
		anchors.fill: parent
		property real startMouseX
		//onEntered: {
		//	startMouseX = mouseX
		//}
		onPressed: {
			startMouseX = mouseX
		}
		onPositionChanged: {
			if(mouseX - startMouseX > units.gu(4)) {
				view.setCurrentIndex((view.currentIndex+1)%view.count)
				startMouseX += units.gu(4)
			}
			else if(startMouseX - mouseX > units.gu(4)) {
				view.setCurrentIndex((view.currentIndex-1+view.count)%view.count)
				startMouseX -= units.gu(4)
			}
		}

		onExited: {indicator.spacing = units.gu(2)}

PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        interactive: false //= dont intercept press
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: units.gu(2)

            delegate: Rectangle {
                height: units.gu(4)
                width: units.gu(3)
                color: "transparent"
            Icon {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: launchermodular.pageModel.get(index).icon
                height: units.gu(2)
                width: units.gu(2)
                color: index === view.currentIndex ? "#E95420" : pressed ? "#000000" : "#FFFFFF"
                id: iconBottomBar
                antialiasing: true
                visible: false
             }
             ColorOverlay{
                 anchors.fill: iconBottomBar
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.verticalCenter: parent.verticalCenter
                 source: iconBottomBar
                 color: index === view.currentIndex ? "#E95420" : pressed ? "#000000" : "#FFFFFF"
                 antialiasing: true
             }

          MouseArea {
                    anchors.fill: parent
                    propagateComposedEvents: true
                      onPressed: {
			             mouse.accepted = false
                        if(index !== view.currentIndex) {
                            view.setCurrentIndex(index);
                            source = indicator.indicatorIcons[view.currentIndex];
                        }
                     }

            }
        }


}
	}
            
Rectangle {
        id: tutorialConfig
        visible: launchermodular.settings.firstRun
        color:"#111111"
        height: units.gu(5)
            anchors {
                top: bottomBarLayout.top
                topMargin: 2
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

    
            Icon {
                anchors.right: staticText.left
                anchors.rightMargin: units.gu(1)
                anchors.verticalCenter: parent.verticalCenter
                width: units.gu(2)
                height: units.gu(2)
                name: "up"
            }
    
            Text {
                id:staticText
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "darkgray"
                text: i18n.tr("Swipe up to configure the launcher")
            }

            Icon {
                anchors.left: staticText.right
                anchors.leftMargin: units.gu(1)
                anchors.verticalCenter: parent.verticalCenter
                width: units.gu(2)
                height: units.gu(2)
                name: "up"
            }
            
    }
            
        transform: Translate {
            y: -(bottomBarSettings.position * bottomBarSettings.height)
        }

        }
    Drawer {
        id: bottomBarSettings
        edge: Qt.BottomEdge
        height: units.gu(8)
        width: parent.width
            
        onOpened: launchermodular.settings.firstRun = false
            
            Row {
                spacing: 4
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                height: units.gu(5)
                /*
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconShortcut
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "keypad"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconShortcut.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Sets shortcut")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    //pageStack.push(Qt.resolvedUrl("Widgetmanagement.qml"))
                                    bottomBarSettings.close()
                            }
                  }
                }*/
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconWidget
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "view-expand"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconWidget.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Add custom icon")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    customIconDialogue.visible = true
                                    bottomBarSettings.close()
                            }
                  }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconPage
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "browser-tabs"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconPage.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Manage page")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    pageStack.push(Qt.resolvedUrl("Pagemanagement.qml"))
                                    bottomBarSettings.close()
                            }
                  }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconUtil
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "preferences-desktop-launcher-symbolic"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconUtil.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Utilities")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    pageStack.push(Qt.resolvedUrl("Util.qml"))
                                    bottomBarSettings.close()
                            }
                  }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconSettings
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "system-settings-symbolic"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconSettings.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Configure Launcher")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    pageStack.push(Qt.resolvedUrl("Settings.qml"))
                                    bottomBarSettings.close()
                            }
                  }
                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconHelp
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "help"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconHelp.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("Help")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    pageStack.push(Qt.resolvedUrl("Help.qml"))
                                    bottomBarSettings.close()
                            }
                  }


                }
                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height
                    width: units.gu(8)
                    Icon {
                        id: iconAbout
                        anchors.horizontalCenter: parent.horizontalCenter
                        name: "info"
                        height: units.gu(3)
                        width: units.gu(3)
                    }
                    Text {
                        anchors.top: iconAbout.bottom
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        text: i18n.tr("About")
                        font.pointSize: units.gu(1)
                        wrapMode:Text.WordWrap
                    }
                  MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                    pageStack.push(Qt.resolvedUrl("About.qml"))
                                    bottomBarSettings.close()
                            }
                  }


                }

            }
    }





/* ******************************** FIN DE LA BARRE EN BAS ******************************** */


                    Rectangle {
                        id: customIconDialogue
                        anchors.fill: parent
                        color: "black"
                        visible: false
                        MouseArea {
                            anchors.fill: parent
                            onClicked: customIconDialogue.visible = false
                        }
                        
                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width*0.75
                        height: parent.height*0.75
                        radius: units.gu(2)
                        color: "white"
                            MouseArea {
                            anchors.fill: parent
                        }
    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: customIconColumn.childrenRect.height+units.gu(2)
        flickableDirection: Flickable.VerticalFlick
        clip: true
        maximumFlickVelocity : units.gu(10)*100
        flickDeceleration: 2500
            
             Column {
                    id: customIconColumn
                    width: parent.width-units.gu(4)
                    spacing: units.gu(2)
                    anchors.horizontalCenter: parent.horizontalCenter
      
                        
                        Item{
                            width: parent.width
                            height: units.gu(4)
                        }
                        
                    UbuntuShape {
                        id: webAppIcon
                        source: Image {
                            id: imageSource
                            source: launchermodular.iconCustomUrl
                        }
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: units.gu(15)
                        height: width
                        color: lightColor
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                           
                        pageStack.push(Qt.resolvedUrl("ImportPage.qml"));
                                
                            }
                        }
                        Label {
                            visible: imageSource.source === "../assets/placeholder-app-icon.svg" ? true : false
                            anchors.fill: parent
                            anchors.margins: units.gu(1)
                            anchors.topMargin: webAppIcon.height / 1.4
                            text: i18n.tr("SVG or PNG icon. 1:1 ratio")
                            wrapMode: Text.Wrap
                        }
                    }
                    

                    TextField {
                        id: appTitle
                        width: parent.width
                        color: "black"
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        placeholderText: i18n.tr("The <b>title</b> to be shown in the app list")
                    }
                 

                  property var modelCustom: [
                    { title: "<font color=\"#6f6f6f\">"+i18n.tr("Website")+"</font>", descr: "<font color=\"#ffffff\">"+i18n.tr("Open the browser with the url")+"</font>", style:"website" },
                    { title: "<font color=\"#ffffff\">"+i18n.tr("Terminal command")+"</font>", descr: "<font color=\"#6f6f6f\">"+i18n.tr("Launch an order in a terminal")+"</font>", style:"terminal" },
                    { title: "<font color=\"#ffffff\">"+i18n.tr("Launch app")+"</font>", descr: "<font color=\"#6f6f6f\">"+i18n.tr("Launch an app")+"</font>", style:"appid" }
                    ]

                    ListItem.ItemSelector {
                        id: typeIconCustom
                        width: parent.width
                        model: customIconColumn.modelCustom
                        delegate: OptionSelectorDelegate {
                                    property var item: model.modelData ? model.modelData : model
                                    text: item.title
                                    subText: item.descr
                                }
                    }
                 
                    TextField {
                        id: appAction
                        width: parent.width
                        color: "black"
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        inputMethodHints: Qt.ImhNoAutoUppercase
                        placeholderText: {
                            if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "website"){i18n.tr("<b>Action</b> example: ")+"https://forums.ubports.com/"}
                            
                            if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "terminal"){i18n.tr("<b>Action</b> example: ")+"sudo reboot"}
                            
                            if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "appid"){i18n.tr("<b>Action</b> example: ")+"dialer-app.desktop"}
                        }
                    }
                 
                 
                 
               

                        Item {
                            height: units.gu(5)
                            width: parent.width
                            Button {
                                anchors.left: parent.left
                                id: okButton
                                text: i18n.tr("Create icon")
                                height: units.gu(4)
                                width: (parent.width/2)-units.gu(2)
                                contentItem: Text {
                                    text: okButton.text
                                    font: okButton.font
                                    color: "#ffffff"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    radius: units.gu(1.5)
                                    color: UbuntuColors.green
                                }
                                
                                property var actionIcon: ""

                                onClicked: {
                                   
                                    if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "website"){ okButton.actionIcon = "browser:///"+appAction.text }

                                    if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "terminal"){ okButton.actionIcon = "terminal:///"+appAction.text }

                                    if(typeIconCustom.model[typeIconCustom.selectedIndex].style === "appid"){ okButton.actionIcon = "application:///"+appAction.text  }
                                
                                launchermodular.customIconModel.append({"name": appTitle.text, "icon": launchermodular.iconCustomUrl, "action": okButton.actionIcon});
                                    
                                launchermodular.getCustomIconArray();
                                launchermodular.settings.customIcon = launchermodular.getCustomIconArray();
                                    
                                AppHandler.sort();
                                    
                                launchermodular.iconCustomUrl = "../assets/placeholder-app-icon.svg";
                                appTitle.text = "";
                                okButton.actionIcon = "";
                                appAction.text = "";

                                customIconDialogue.visible = false

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
                                    onClicked: {
                                    
                                    launchermodular.iconCustomUrl = "../assets/placeholder-app-icon.svg";
                                    appTitle.text = "";
                                    okButton.actionIcon = "";
                                    appAction.text = "";
                                    customIconDialogue.visible = false

                                    }
                                 }
                             }
                         }
                      }
                   }
                }
             }
          }
       }
    }
