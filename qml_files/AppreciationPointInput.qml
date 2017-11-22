import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning
Rectangle {
    id: appreciationPointWindow
    width: parent.width
    height: parent.height
    focus: true
    objectName: "appreciationPointWindow"

    signal transmitStudentData(string studentName, int appreciation, string information)

    NavbarWithoutDrawer {
        id: navbar
    }

    Rectangle {
        id: title
        anchors.top: navbar.bottom
        anchors.topMargin: parent.height / 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 15
        height: parent.height / 20
        //color: "#1ebc10"

        Text {
            id: textTitle
            anchors.centerIn: parent
            text: "Pemasukkan Data Penghargaan"
            color: "#1ebc10"
        }

        Line {
            anchors.top: textTitle.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Text {
        id: titleStudentInput
        text: qsTr("Nama Siswa")
        color: "white"
        anchors.top: title.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
    }

    Rectangle {
        id: studentTextInputContainer
        width: ModellingAndPositioning.variantSquareSizing(95)
        height: parent.height / 15
        anchors.top: titleStudentInput.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        TextField {
            id: studentInput
            height: parent.height
            anchors.left: parent.left
            anchors.right: parent.right
            placeholderText: "Masukkan NIS"
            objectName: "studentName"
        }
    }

    Text {
        id: warningMessageStudentData
        objectName: "warningMessageStudentData"
        text: "Nama Siswa Yang Dituju Tidak Terdaftar"
        color: "#e52626"
        visible: false
        anchors.top: studentTextInputContainer.bottom
        x: studentTextInputContainer.x
    }

    Text {
        id: warningMessage
        text: "Mohon Mengisi Nama Siswa Yang Dituju"
        color: "#e52626"
        visible: false
        anchors.top: studentTextInputContainer.bottom
        x: studentTextInputContainer.x
    }

    Rectangle {
        id: comboBoxKindsContainer
        width: parent.width - 15
        height: ModellingAndPositioning.variantSquareSizing(15)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: studentTextInputContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(6)
        border.width: 1
        border.color: "#1ebc10"
        radius: 10

        Text {
            id: comboBoxTitle
            text: "Jenis Penghargaan"
            color: "#1ebc10"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ComboBox {
                id: comboBoxKinds
                currentIndex: 2
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
                onCurrentIndexChanged: console.debug(comboBoxKinds.currentText)
                height: parent.height - comboBoxTitle.height
                width: parent.width
                anchors.top: comboBoxTitle.bottom
                //anchors.topMargin: ModellingAndPositioning.topMargin1()
                anchors.bottom: parent.bottom
        }
    }

    Rectangle {
        id: informationInputContainer
        width: parent.width - 15
        height: parent.height / 3
        anchors.top: comboBoxKindsContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(6)
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 1
        border.color: "#1ebc10"
        radius: 10

        Text {
            id: informationInputTitle
            text: "Keterangan Tambahan"
            color: "#1ebc10"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextInput {
            id: additionalInformation
            width: ModellingAndPositioning.squareSizing90()
            height: parent.height - informationInputTitle.height
            wrapMode: TextInput.Wrap
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: sendDataIndicatorContainer
        objectName: "sendDataIndicatorContainer"
        width: ModellingAndPositioning.squareSizing40()
        height: ModellingAndPositioning.squareSizing40()
        color: "#404040"
        anchors.centerIn: parent
        opacity: 0.7
        radius: 10
        visible: false

        BusyIndicator{
            id: sendDataIndicator
            anchors.centerIn: parent
            running: true
        }

        Text {
            id: sendDataIndicatorText
            width: parent.width
            anchors.top: sendDataIndicator.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: "Mengirim Data"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Rectangle {
        id: buttonSubmit
        width: (parent.width - 30) / 2
        height: ModellingAndPositioning.squareSizing10()
        anchors.top: informationInputContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(6)
        x: informationInputContainer.x
        color: "#41CD52"
        radius: 5

        Text {
            id: buttonSubmitText
            text: qsTr("Tetapkan")
            anchors.centerIn: parent
            color: "white"
        }


        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(studentInput.text.length == 0 && comboBoxKinds.currentText.length == 0) {
                    studentTextInputContainer.border.color = "#e52626"
                    warningMessage.visible = true
                    comboBoxKindsContainer.border.color = "#e52626"
                }
                else if(studentInput.text.length == 0 && comboBoxKinds.currentText.length > 0) {
                    studentTextInputContainer.border.color = "#e52626"
                    warningMessage.visible = true
                    comboBoxKindsContainer.border.color = "#1ebc10"
                }
                else if(studentInput.text.length > 0 && comboBoxKinds.currentText.length == 0) {
                    studentTextInputContainer.border.color = "white"
                    warningMessage.visible = false
                    comboBoxKindsContainer.border.color = "#e52626"
                }

                else if(studentInput.text.length > 0 && comboBoxKinds.currentText.length > 0) {
                    warningMessage.visible = false
                    studentTextInputContainer.border.color = "white"
                    comboBoxKindsContainer.border.color = "#1ebc10"
                    appreciationPointWindow.transmitStudentData(studentInput.text, comboBoxKinds.currentIndex + 1,
                                                                    additionalInformation.text)
                }
            }
        }
    }

    Rectangle {
        id: buttonCancel
        width: (parent.width - 30) / 2
        height: ModellingAndPositioning.squareSizing10()
        anchors.top: informationInputContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(6)
        x: informationInputContainer.width - buttonSubmit.width + 6
        color: "#41CD52"
        radius: 5

        Text {
            id: buttonCancelText
            text: qsTr("Batal")
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainAppLoader.active = true
                mainAppLoader.focus = true
                loadAppreciationLayout.active = false
                loadAppreciationLayout.focus = false
            }
        }
    }

    OpacityAnimator {
        target: appreciationPointWindow
        from: 0
        to: 1
        duration: 500
        running: true
    }
}
