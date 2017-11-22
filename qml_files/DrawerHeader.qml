import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height / 3

    Image {
        id: appIcon
        source: "icons/Icons/APPS_ICON.png"
        width: (parent.height / 100) * 45
        height: (parent.height / 100) * 45
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    Text{
        id: drawerHeaderTitle
        anchors.left: appIcon.right
        anchors.verticalCenter: parent.verticalCenter
        text: "APPS"
        font.pixelSize: appIcon.height / 2
        anchors.leftMargin: 20
    }
}
