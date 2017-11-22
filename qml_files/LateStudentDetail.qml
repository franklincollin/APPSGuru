import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: profileBox
    width: ModellingAndPositioning.lateStudentBoxPositioning()
    height: parent.height / 3
    x: fragmentHomeInput.x

    Rectangle {
        id: profileImage
        width: ModellingAndPositioning.lateStudentImage()
        height: ModellingAndPositioning.lateStudentImage()
        anchors.top: profileBox.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 5
        layer.enabled: true

        Image {
            anchors.fill: parent
            anchors.centerIn: parent
            source: "icons/Icons/user.png"
        }
    }

    Text {
        id: nama
        anchors.left: parent.left
        anchors.topMargin: 5
        text: "Nama: "
        anchors.leftMargin: 15
        anchors.top: profileImage.bottom
    }

    Text {
        id: kelas
        anchors.left: parent.left
        anchors.top: nama.bottom
        anchors.topMargin: Text.height
        text: "Kelas: "
        anchors.leftMargin: 15
    }

    Text {
        id: pointPelanggaran
        anchors.left: parent.left
        anchors.topMargin: Text.height
        anchors.top: kelas.bottom
        text: "Point Pelanggaran: "
        anchors.leftMargin: 15
    }

    Text {
        id: pointPenghargaan
        anchors.left: parent.left
        anchors.topMargin: Text.height
        anchors.top: pointPelanggaran.bottom
        text: "Point Penghargaan: "
        anchors.leftMargin: 15
    }

}
