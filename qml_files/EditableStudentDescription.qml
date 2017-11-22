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
                completeInformation = informationContainer.text
                pointValue = pointContainer.currentText
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
