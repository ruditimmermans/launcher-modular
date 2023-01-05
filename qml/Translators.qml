import QtQuick 2.9
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import QtQuick.Controls 2.2
import Lomiri.Components 1.3
import "pages"

Page {
    id: pageTranslators

    header: PageHeader {
        id: translatorsPage
        title: i18n.tr("Translators");
       StyleHints {
           foregroundColor: "#FFFFFF";
           backgroundColor: "#111111";
       }
            leadingActionBar.actions:
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        pageStack.pop();
        }
     }
  }

    Rectangle {
        id:rect1
        color: "#111111"
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

Item {
      width: parent.width
      height: parent.height

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }

        Item {
            width: parent.width
            height: units.gu(5)
            Label {
                text: "Launcher Modular"
                anchors.centerIn: parent
                fontSize: "x-large"
                color: "#ffffff"
            }
        }

        Item {
            width: parent.width
            height: units.gu(14)

            LomiriShape {
                radius: "medium"
                source: Image {
                    source: Qt.resolvedUrl("../assets/logo.svg");
                }
                height: units.gu(12); width: height;
                anchors.centerIn: parent;


            } // shape
        }/// item

        Item {
            width: parent.width
            height: translators1Label.height + units.gu(2)
            Label {
                id: translators1Label
                text: i18n.tr("Launcher Modular translators:")
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
        }

        Item {
            width: parent.width
            height: units.gu(2)
        }

        Item {
            width: parent.width
            height: trans1Label.height + units.gu(2)
            Label {
                id: trans1Label
                text: i18n.tr("Dutch - ") + "Sander Klootwijk"
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }

        Item {
            width: parent.width
            height: trans2Label.height + units.gu(2)
            Label {
                id: trans2Label
                text: i18n.tr("French - ") + "Steve Kueffer"
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }

        Item {
            width: parent.width
            height: trans3Label.height + units.gu(2)
            Label {
                id: trans3Label
                text: i18n.tr("German - ") + "Daniel Frost"
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }

        Item {
            width: parent.width
            height: trans4Label.height + units.gu(2)
            Label {
                id: trans4Label
                text: i18n.tr("Portuguese - ") + "Gil"
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }

        Item {
            width: parent.width
            height: trans5Label.height + units.gu(2)
            Label {
                id: trans5Label
                text: i18n.tr("Russian - ") + "Dema"
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }

        Item {
            width: parent.width
            height: translation.height + units.gu(4)
            Label {
                id: translation
                text: i18n.tr("If you like to translate Launcher Modular into your own language, go to <a href='https://hosted.weblate.org/projects/ubports/launcher-modular/'>Weblate</a> for more details.")
                onLinkActivated: Qt.openUrlExternally(link)
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
                color: "#ffffff"
            }
          }
        }
      }
    }
// TRANSLATORS PAGE
}
