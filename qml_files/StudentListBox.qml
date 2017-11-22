import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: profileListBox
    width: ModellingAndPositioning.studentListPositioning()
    height: ModellingAndPositioning.variantSquareSizing(47)
    border.width: 1
    border.color: "#1ebc10"
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Daftar Siswa"
        color: "#1ebc10"
    }

    Text{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Tidak Ada Data"
        color: "black"
    }
}
