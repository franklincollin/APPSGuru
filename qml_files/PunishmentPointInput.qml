import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: punishmentPointWindow
    objectName: "punishmentPointWindow"
    width: parent.width
    height: parent.height
    focus: true
    signal transmitPunishmentInputData(string nameStudent, int punishment, string information)
    signal transmitSetFragmentEditDefault()
    property string studentTextInputContainerColor: "white"

    NavbarWithoutDrawer{
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
            text: "Pemasukkan Data Pelanggaran"
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
        objectName: "studentTextInputContainer"
        width: ModellingAndPositioning.variantSquareSizing(95)
        height: parent.height / 15
        anchors.top: titleStudentInput.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 1
        border.color: "white"

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
        id: warningMessageInternet
        objectName: "warningMessageInternet"
        text: "Tidak Ada Koneksi Internet"
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
            text: "Jenis Pelanggaran"
            color: "#1ebc10"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ComboBox {
                id: comboBoxKinds
                currentIndex: 2
                model: ListModel {
                    id: cbItems
                    ListElement { text: "Melawan Guru/Karyawan Secara Langsung"; color: "Gray" }
                    ListElement { text: "Mengedarkan, Menyimpan dan Memakai Narkoba/Miras"; color: "Gray" }
                    ListElement { text: "Menikah Legal/Ilegal Selama Menjadi Siswa"; color: "Gray" }
                    ListElement { text: "Ikut Dalam Tawuran"; color: "Gray" }
                    ListElement { text: "Menjadi Anggota Perkumpulan Terlarang"; color: "Gray" }
                    ListElement { text: "Peserta Didik Putri Yang Hamil dan Siswa Yang Menghamili"; color: "Gray" }
                    ListElement { text: "Menjadi Terdakwa Dalam Perkara Tindak Pidana Kriminal"; color: "Gray" }
                    ListElement { text: "Peserta Didik Laki-laki Yang Ditindik"; color: "Gray" }
                    ListElement { text: "Peserta Didik Perempuan Yang Ditindik Tidak Wajar"; color: "Gray" }
                    ListElement { text: "Bertato"; color: "Gray" }
                    ListElement { text: "Membawa Senjata Tajam/Api"; color: "Gray" }
                    ListElement { text: "Melakukan Tindakan Asusila/Tercela"; color: "Gray" }
                    ListElement { text: "Mencuri"; color: "Gray" }
                    ListElement { text: "Membawa Dan Merokok Di Sekolah"; color: "Gray" }
                    ListElement { text: "Membawa Sesuatu Yang Berhubungan Dengan Pornografi"; color: "Gray" }
                    ListElement { text: "Melakukan Palak"; color: "Gray" }
                    ListElement { text: "Memalsukan Dokumen Penting"; color: "Gray" }
                    ListElement { text: "Melecehkan Guru Secara Tidak Langsung"; color: "Gray" }
                    ListElement { text: "Merusak Nama Baik Sekolah"; color: "Gray" }
                    ListElement { text: "Memalsukan Surat Atau Tandatangan Orangtua/Wali"; color: "Gray" }
                    ListElement { text: "Tidak Mengikuti Sholat Jumat"; color: "Gray" }
                    ListElement { text: "Membohongi Guru"; color: "Gray" }
                    ListElement { text: "Menyontek Saat Ulangan"; color: "Gray" }
                    ListElement { text: "Menggunakan Hand Phone Tanpa Izin Selama KBM"; color: "Gray" }
                    ListElement { text: "Melompat Pagar"; color: "Gray" }
                    ListElement { text: "Mengganggu Proses Belajar"; color: "Gray" }
                    ListElement { text: "Mencorat-coret Fasilitas Sekolah"; color: "Gray" }
                    ListElement { text: "Memakai Perhiasan Berlebihan"; color: "Gray" }
                    ListElement { text: "Membuang Sampah Sembarangan, Tidak Melaksanakan Tugas Piket"; color: "Gray" }
                    ListElement { text: "Tidak Menyampaikan Surat Dari Sekolah Kepada Orangtua"; color: "Gray" }
                    ListElement { text: "Tidak Hadir Tanpa Keterangan"; color: "Gray" }
                    ListElement { text: "Berada Di Luar Kelas Saat Jam Pelajaran"; color: "Gray" }
                    ListElement { text: "Tidak Ikut Upacara Tanpa Alasan"; color: "Gray" }
                    ListElement { text: "Tidak Membawa Peralatan Belajar, Tidak Mengerjakan PR"; color: "Gray" }
                    ListElement { text: "Terlambat Masuk Sekolah"; color: "Gray" }
                    ListElement { text: "Meninggalkan Buku Pelajaran Di Kelas"; color: "Gray" }
                    ListElement { text: "Baju Dikeluarkan"; color: "Gray" }
                    ListElement { text: "Tidak Menggunakan Atribut Pakaian Yang Benar"; color: "Gray" }
                    ListElement { text: "Rambut Siswa Panjang"; color: "Gray" }
                    ListElement { text: "Pakaian Tidak Pantas"; color: "Gray" }
                    ListElement { text: "Tidak Menggunakan Pakaian Yang Benar"; color: "Gray" }
                    ListElement { text: "Memakai Sepatu Dengan Posisi Yang Salah"; color: "Gray" }
                    ListElement { text: "Tidak Menggunakan Atribut Lengkap"; color: "Gray" }
                    ListElement { text: "Siswa Memakai Perhiasan"; color: "Gray" }
                    ListElement { text: "Tidak Memakai Kaos Kaki Hitam Pada Hari Rabu"; color: "Gray" }
                    ListElement { text: "Mewarnai Rambut Atau Bibir"; color: "Gray" }
                    ListElement { text: "Sepatu Tidak Berwarna Hitam"; color: "Gray" }
                    ListElement { text: "Pakaian Jilbab Tidak Sesuai Peraturan Agama Islam"; color: "Gray" }
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
                    transmitPunishmentInputData(studentInput.text, comboBoxKinds.currentIndex + 1,
                                                                    additionalInformation.text)
                }
            }
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
            objectName: "sendDataIndicator"
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

        MouseArea {
            anchors.fill: parent

            onClicked: {
                mainAppLoader.active = true
                mainAppLoader.focus = true
                loadPunishmentLayout.visible = false
                loadPunishmentLayout.active = false
                transmitSetFragmentEditDefault()
            }
        }
    }

    OpacityAnimator {
        target: punishmentPointWindow
        from: 0
        to: 1
        duration: 500
        running: true
    }
}
