import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    width: parent.width
    height: parent.height / 12
    color: "#1ebc10"
    anchors.top: parent.top

    Text {
        text: "APPS"
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "white"
    }

    Rectangle {
        id: navArrowIconContainer
        width: parent.height
        height: parent.height
        anchors.right: parent.right
        color: "#1ebc10"

        Image {
            id: navArrowIcon
            width: (parent.height / 100) * 60
            height: (parent.height / 100) * 60
            source: "icons/Icons/right-arrow.png"
            anchors.centerIn: parent
            antialiasing: true
        }
    }
}
