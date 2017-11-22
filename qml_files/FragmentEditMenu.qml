import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Item {
    signal showDeleteDataLayout(string command)

    Rectangle {
        id: menu1Container
        width: parent.width / 2
        height: parent.height / 2
        anchors.left: parent.left
        anchors.top: parent.top

        Image {
            id: menu1Image
            anchors.centerIn: parent
        }

        Text {
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: menu1Image.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            text: "PELANGGARAN"
            color: "#1ebc10"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                loadPunishmentLayout.source = "PunishmentPointInput.qml"
                loadPunishmentLayout.visible = true
                loadPunishmentLayout.active = true
            }
        }
    }

    Rectangle {
        id: menu2Container
        width: parent.width / 2
        height: parent.height / 2
        anchors.left: menu1Container.right

        Image {
            id: menu2Image
            anchors.centerIn: parent
        }

        Text {
            text: "PENGHARGAAN"
            font.pixelSize: 20
            anchors.top: menu2Image.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1ebc10"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                loadAppreciationLayout.source = "AppreciationPointInput.qml"
                loadAppreciationLayout.active = true
            }
        }
    }

    Rectangle {
        id: menu3Container
        width: parent.width / 2
        height: parent.height / 2
        anchors.left: parent.left
        anchors.top: menu1Container.bottom

        Image {
            id: menu3Image
            anchors.centerIn: parent
        }

        Text {
            text: "HAPUS DATA"
            font.pixelSize: 20
            anchors.top: menu3Image.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1ebc10"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                loadDeleteDataScreen.source = "DeleteData.qml"
                loadDeleteDataScreen.active = true
            }
        }
    }

    Rectangle {
        id: menu4Container
        width: parent.width / 2
        height: parent.height / 2
        anchors.left: menu3Container.right
        anchors.top: menu2Container.bottom

        Image {
            id: menu4Image
            anchors.centerIn: parent
        }

        Text {
            text: "PERBARUI DATA"
            font.pixelSize: 20
            anchors.top: menu4Image.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1ebc10"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                loadUpdateDataLayout.source = "UpdateDataLayout.qml"
                loadUpdateDataLayout.active = true
            }
        }
    }

    Component.onCompleted: {
        if(parent.width >= 310) {
            menu1Image.source = "/icons-64px/012-pencil.png"
            menu2Image.source = "/icons-64px/011-medal.png"
            menu3Image.source = "/icons-64px/010-cancel-button.png"
            menu4Image.source = "/icons-64px/009-refresh-button.png"
        }
        if(parent.width >= 600) {
            menu1Image.source = "/icons-64px/012-pencil.png"
            menu2Image.source = "/icons-64px/011-medal.png"
            menu3Image.source = "/icons-64px/010-cancel-button.png"
            menu4Image.source = "/icons-64px/009-refresh-button.png"
        }
    }
}
