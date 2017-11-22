import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: profileBox
    width: ModellingAndPositioning.profileDetailPositioning()
    height: parent.height / 3
    x: fragmentHomeInput.x
    border.width: 1
    border.color: "black"

    Image {
        id: profileImage
        source: "icons/Icons/user.png"
        width: ModellingAndPositioning.profileImageSize()
        height: ModellingAndPositioning.profileImageSize()
        anchors.left: profileBox.left
        anchors.verticalCenter: profileBox.verticalCenter
        anchors.leftMargin: 5
    }

    Text {
        id: nama
        anchors.left: profileImage.right
        anchors.topMargin: 30
        text: "Nama: "
        anchors.leftMargin: 15
    }

    Text {
        id: kelas
        anchors.left: profileImage.right
        anchors.top: nama.bottom
        anchors.topMargin: nama.height
        text: "Kelas: "
        anchors.leftMargin: 15
    }

    Text {
        id: pointPelanggaran
        anchors.left: profileImage.right
        anchors.topMargin: nama.height
        anchors.top: kelas.bottom
        text: "Point Pelanggaran: "
        anchors.leftMargin: 15
    }

    Text {
        id: pointPenghargaan
        anchors.left: profileImage.right
        anchors.topMargin: nama.height
        anchors.top: pointPelanggaran.bottom
        text: "Point Penghargaan: "
        anchors.leftMargin: 15
    }
}
