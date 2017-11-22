import QtQuick 2.0

Rectangle {
    id: aboutMenuContainer
    width: parent.width - 10
    height: parent.height / 17
    anchors.leftMargin: 10
    anchors.left: parent.left

    Image {
        id: aboutIcon
        width: aboutMenuContainer.height
        height: aboutMenuContainer.height
    }

    Text {
            id: textProfileMenu
            text: "Bantuan"
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.left: aboutIcon.right
            verticalAlignment: Text.verticalAlignment
            anchors.verticalCenter: parent.verticalCenter
     }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            appDrawer.close()
            loadAboutLayout.source = "AboutLayout.qml"
            loadAboutLayout.active = true
        }
    }

    Component.onCompleted: {
        if(mainWindow.width >= 310) {
            aboutIcon.source = "/icons-64px/006-information-button.png"
        }
    }
}
