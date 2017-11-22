import QtQuick 2.0

Rectangle {
    id: profileMenuContainer
    width: parent.width - 10
    height: parent.height / 17
    anchors.leftMargin: 10
    anchors.left: parent.left

    signal setProfileDetail(string arg0)

    Image {
        id: profileIcon
        width: profileMenuContainer.height
        height: profileMenuContainer.height
    }

    Text {
            id: textProfileMenu
            objectName: "textProfileMenu"
            text: "Lihat Profil"
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.left: profileIcon.right
            verticalAlignment: Text.verticalAlignment
            anchors.verticalCenter: parent.verticalCenter
     }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            //parent.color = "#cacaca"
        }
        onReleased: {
            //parent.color = "white"
            appDrawer.close()
            loadProfileLayout.source = "ProfileLayout.qml"
            loadProfileLayout.active = true
            setProfileDetail("Profile Layout Loaded")
        }
    }

    Component.onCompleted: {
        if(mainWindow.width >= 310) {
            profileIcon.source = "/icons-64px/008-user.png"
        }
    }
}
