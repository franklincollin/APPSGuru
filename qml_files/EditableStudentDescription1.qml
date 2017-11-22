import QtQuick 2.7
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: completeAdditionalInformation
    anchors.centerIn: parent
    radius: 10
    visible: false

    signal buttonClicked()

    Rectangle{
        id: minimizeIconContainer
        width: ModellingAndPositioning.variantSquareSizing(7)
        height: ModellingAndPositioning.variantSquareSizing(7)
        objectName: "zoomIconContainer"
        anchors.top: parent.top
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.right: parent.right
        anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(1)

        Image{
            id: minimizeIcon
            //anchors.fill: parent
            anchors.centerIn: parent
            source: "icons/Icons/001-remove.png"
            antialiasing: true
        }

        MouseArea{
            anchors.fill: parent

            onClicked: {
                completeAdditionalInformation.width = 0
                completeAdditionalInformation.height = 0
                completeAdditionalInformation.visible = false
                blackBackGround.visible = false
            }
        }
    }

    Text {
        id: additionalInformationTitle
        text: "Keterangan"
        anchors.top: parent.top
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#1ebc10"
    }

    Line{
        id: limiter
        anchors.top: additionalInformationTitle.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: studentNameTitle
        color: "#1ebc10"
        text: "Nama: "
        anchors.top: limiter.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: studentNameContainer
        objectName: "studentNameContainer"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: studentNameTitle.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
    }

    Text{
        id: dateTimeTitle
        color: "#1ebc10"
        text: "Tanggal/Waktu: "
        anchors.top: studentNameContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text{
        id: dateTimeContainer
        objectName: "dateTimeContainer"
        anchors.top: dateTimeTitle.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text{
        id: pointTitle
        color: "#1ebc10"
        anchors.top: dateTimeContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "point: "
    }

    ComboBox {
            id: pointContainer
            model: ListModel {
                id: cbItems
                ListElement { text: "Menjadi Petugas Upacara Tingkat Sekolah"; color: "Gray" }
                ListElement { text: "Menjadi Pengurus Kelas Yang Bertanggungjawab"; color: "Gray" }
                ListElement { text: "Melaksanakan Tugas Kebersihan Sekolah"; color: "Gray" }
                ListElement { text: "Menjadi Petugas Pengibar Bendera Tingkat Wilayah"; color: "Gray" }
                ListElement { text: "Menjadi Ketua Kelas Bertanggungjawab"; color: "Gray" }
                ListElement { text: "Membawa Nama Baik Sekolah Di Tingkat Kecamatan"; color: "Gray" }
                ListElement { text: "Menjadi Petugas Pengibar Bendera Tingkat Provinsi"; color: "Gray" }
                ListElement { text: "Menjadi Petugas Pengibar Bendera Tingkat Nasional"; color: "Gray" }
                ListElement { text: "Menjadi Pengurus OSIS Dan Bertugas Dengan Bai"; color: "Gray" }
                ListElement { text: "Membawa Nama Baik Sekolah Di Tingkat Wilayah"; color: "Gray" }
                ListElement { text: "Membawa Nama Baik Sekolah Di Tingkat Provinsi"; color: "Gray" }
                ListElement { text: "Membawa Nama Baik Sekolah Di Tingkat Nasional"; color: "Gray" }
                ListElement { text: "Membawa Nama Baik Sekolah Di Tingkat Internasional"; color: "Gray" }
            }
            onCurrentIndexChanged: console.debug(pointContainer.currentText)
            objectName: "pointContainer"
            anchors.top: pointTitle.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: parent.right
            anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(3)
            anchors.left: parent.left
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(3)
    }

    Text {
        id: informationTitle
        color: "#1ebc10"
        anchors.top: pointContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Keterangan: "
    }

    TextInput {
        id: informationContainer
        wrapMode: Text.WordWrap
        objectName: "informationContainer"
        anchors.top: informationTitle.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.left: parent.left
        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(1)
        anchors.right: parent.right
        anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(1)
    }

    Rectangle{
        id: buttonUpdate
        height: ModellingAndPositioning.variantHeightSquareSizing(10)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.right: parent.right
        anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(3)
        anchors.left: parent.left
        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(3)
        radius: 10
        color: "#404040"

        Text{
            id: buttonText
            color: "white"
            anchors.centerIn: parent
            text: "PERBARUI"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                completeAdditionalInformation.width = 0
                completeAdditionalInformation.height = 0
                completeAdditionalInformation.visible = false
                blackBackGround.visible = false
                dataID = pointContainer.currentIndex + 1
                pointValue = pointContainer.currentText
                completeInformation = informationContainer.text
                buttonClicked()
            }
        }
    }

    Behavior on width {
        NumberAnimation{
            duration: 300
            easing.type: Easing.Linear
        }
    }

    Behavior on height {
        NumberAnimation{
            duration: 200
            easing.type: Easing.Linear
        }
    }

    Behavior on width {
        NumberAnimation{
            target: buttonUpdate
            duration: 300
            easing.type: Easing.Linear
        }
    }

    Behavior on height {
        NumberAnimation{
            target: buttonUpdate
            duration: 200
            easing.type: Easing.Linear
        }
    }

    onWidthChanged: {
        studentNameContainer.text = studentName
        dateTimeContainer.text = dateTimeLog
        informationContainer.text = completeInformation
        pointContainer.currentIndex = dataID - 1
    }
}
