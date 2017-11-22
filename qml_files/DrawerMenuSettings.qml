import QtQuick 2.0

Rectangle {
    id: settingsMenuContainer
    width: parent.width - 10
    height: parent.height / 17
    anchors.leftMargin: 10
    anchors.left: parent.left

    Image {
        id: settingsIcon
        width: settingsMenuContainer.height
        height: settingsMenuContainer.height
    }

    Text {
            id: textProfileMenu
            text: "Setelan"
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.left: settingsIcon.right
            verticalAlignment: Text.verticalAlignment
            anchors.verticalCenter: parent.verticalCenter
     }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            appDrawer.close()
        }
    }

    Component.onCompleted: {
        if(mainWindow.width >= 310) {
            settingsIcon.source = "/icons-64px/007-settings-work-tool.png"
        }
    }
}
