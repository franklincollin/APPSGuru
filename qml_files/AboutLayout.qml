import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: aboutLayout
    width: parent.width
    height: parent.height

    Image {
        id: appsIcon
        width: ModellingAndPositioning.appsImage()
        height: ModellingAndPositioning.appsImage()
        source: "icons/Icons/APPS_ICON.png"
        anchors.top: parent.top
        anchors.topMargin: parent.height / 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: information
        anchors.top: appsIcon.bottom
        anchors.topMargin: parent.height / 30
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        text: "Aplikasi ini adalah aplikasi untuk mengelola data point
               siswa, baik point pelanggaran, maupun point penghargaan. Aplikasi ini
               tersedia dalam 3 versi: Guru , Murid, Dan Orang Tua. Anda bisa
               menghubungi pengembang untuk informasi lebih lanjut, atau meminta
               pembuatan aplikasi khusus untuk keperluan anda "
        wrapMode: Text.WordWrap
    }
}
