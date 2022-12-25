import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import Lomiri.Components.ListItems 1.3 as ListItem
import MySettings 1.0
import AppHandler 1.0
import "../widgets"
import QtQuick.Controls 2.2
import Lomiri.Components 1.3
import Lomiri.Components.Popups 0.1
import Qt.labs.folderlistmodel 2.1


Item {
    id: picture

    GridView {
        id: gview
        anchors.fill: parent
        anchors {
            rightMargin: units.gu(2)
            leftMargin: units.gu(2)
            topMargin: units.gu(2)
        }
        cellHeight: iconbasesize+units.gu(8)
        property real iconbasesize: units.gu(14)
        cellWidth: Math.floor(width/Math.floor(width/iconbasesize))

        focus: true
        model: folderModel


    FolderListModel {
        id: folderModel
        nameFilters: ["*.png", "*.jpg", "*.jpeg"]
        folder: launchermodular.settings.folderimage
        showDirs: false
    }

        delegate: Rectangle {
                    width: gview.cellWidth
                    height: gview.iconbasesize
                    color: "transparent"

                    Item {
                        width: units.gu(12)
                        height: units.gu(20)
                            anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            id: imgIcons
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: parent.height
                            source: filePath
                            visible: false
                            fillMode: Image.PreserveAspectCrop
                        }

                        LomiriShape {
                            source: imgIcons
                            width: parent.width
                            height: parent.height
                            radius : "medium"
                            sourceFillMode: LomiriShape.PreserveAspectCrop
                        }
                            MouseArea {
                                anchors.fill: parent
                                onClicked:Qt.openUrlExternally("application:///com.lomiri.gallery_gallery.desktop")
                                }
                    } // Item
            }// delegate Rectangle

        }

}
