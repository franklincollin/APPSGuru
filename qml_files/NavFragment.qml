import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    width: parent.width
    height: parent.height / 10
    color: "#1ebc10"
    border.width: 1
    border.color: "black"

    ///////////////////////////////!WARNING! SUPER SENSITIVE CODE///////////////////////////////
    //Change this code without any understanding about the codes would cause several heavy damages
    //Merubah kode tanpa pengetahuan/pengertian mengenai kode yang tertulis dapat menyebabkan beberapa kerusakan parah

    Rectangle {
        id: homeIconContainer
        width: parent.width / 3
        height: parent.height - 3
        anchors.left: parent.left
        color: "#1ebc10"
        Image {
            id: home
            //source: "icons/Icons/008-internet.png"
            width: (parent.height / 100) * 50
            height: (parent.height / 100) * 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onReleased: {
                ModellingAndPositioning.fragmentHomePositioned()
            }
        }
    }

    Rectangle {
        id: editIconContainer
        width: parent.width / 3
        height: parent.height - 3
        anchors.horizontalCenter: parent.horizontalCenter
        //border.width: 1
        //border.color: "black"
        color: "#1ebc10"
        Image {
            id: edit
            //source: "icons/Icons/mechanical-pen.png"
            width: (parent.height / 100) * 50
            height: (parent.height / 100) * 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true

            ColorAnimation {
                target: edit
                from: "black"
                to: "white"
                duration: 0
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onReleased: {
                ModellingAndPositioning.fragmentEditPositioned()
            }
        }
    }

    Rectangle {
        id: viewIconContainer
        width: parent.width / 3
        height: parent.height - 3
        anchors.right: parent.right
        //border.width: 1
        //border.color: "black"
        color: "#1ebc10"
        Image {
            id: view
            //source: "icons/Icons/002-user-list.png"
            width: (parent.height / 100) * 50
            height: (parent.height / 100) * 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onReleased: {
                ModellingAndPositioning.fragmentViewPositioned()
            }
        }
    }

    Component.onCompleted: {
        if(parent.width >= 310) {
            home.source = "/icons-64px/015-home-page.png"
            edit.source = "/icons-64px/014-tool.png"
            view.source = "/icons-64px/013-user-list.png"
        }
    }

    ///////////////////////////////!WARNING! SENSITIVE CODE(END)///////////////////////////////
}
