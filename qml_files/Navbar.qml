import QtQuick 2.0
import QtQuick 2.7

Rectangle {
    width: parent.width
    height: parent.height / 12
    color: "#1ebc10"

    Image {
        id: appsIcon
        source: "icons/Icons/menu.png"
        height: (parent.height / 100) * 50
        width: (parent.height / 100) * 50
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        antialiasing: true

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onReleased: {
                appDrawer.open()
            }
        }
    }

    Text {
        text: "APPS"
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: appsIcon.right
        anchors.leftMargin: 10
        color: "white"
    }
}
