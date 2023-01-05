import QtQuick 2.9
import Lomiri.Components 1.3
import Lomiri.Content 1.3

Page {
    id: picker
	
    signal cancel()
                
    header: PageHeader {
        title: i18n.tr("Choose")
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                    pageStack.pop()
                }
                }
            ]         
    }

    ContentPeerPicker {
        anchors { fill: parent; topMargin: picker.header.height }
        visible: parent.visible
        showTitle: false
        contentType: ContentType.Pictures
        handler: ContentHandler.Source

        onPeerSelected: {
            peer.selectionType = ContentTransfer.Single
            picker.activeTransfer = peer.request()
            picker.activeTransfer.stateChanged.connect(function() {
				if (picker.activeTransfer.state === ContentTransfer.InProgress) {
					console.log("In progress");
					picker.activeTransfer.items = picker.activeTransfer.items[0].url = url;
					picker.activeTransfer.state = ContentTransfer.Charged;
				}
                if (picker.activeTransfer.state === ContentTransfer.Charged) {
					console.log("Charged");
                    picker.imported(picker.activeTransfer.items[0].url)
					console.log(picker.activeTransfer.items[0].url)
                    picker.activeTransfer = null
                }
            })
        }
       

        onCancelPressed: {
            pageStack.pop()
        }
    }

    ContentTransferHint {
        id: transferHint
        anchors.fill: parent
        activeTransfer: picker.activeTransfer
    }

    
    
Connections {
        target: ContentHub

        onImportRequested: {
            var filePath = String(transfer.items[0].url).replace('file://', '')
            launchermodular.iconCustomUrl = filePath;
            pageStack.pop()
        }
}
    
}
