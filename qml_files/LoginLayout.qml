import QtQuick 2.0
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: loginLayout
    width: parent.width
    height: parent.height
    color: "#404040"
    signal transmitLoginData(string username, string password)

    Rectangle {
        id: appIconContainer
        width: ModellingAndPositioning.squareSizing30()
        height: ModellingAndPositioning.squareSizing30()
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#404040"

        Image {
            id: appIcon
            anchors.fill: parent
            source: "icons/Icons/APPS_ICON.png"
        }
    }

    Text {
        id: appName
        width: ModellingAndPositioning.squareSizing40()
        height: ModellingAndPositioning.squareSizing10()
        horizontalAlignment: Text.AlignHCenter
        anchors.top: appIconContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "APPS"
        color: "white"
    }

    Text {
        id: kepanjanganAPPS
        anchors.top: appName.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Aplikasi Pengelola Point Siswa"
        color: "white"
    }

    Rectangle{
        id: loginDataContainer
        width: ModellingAndPositioning.squareSizing80();
        //height: ModellingAndPositioning.squareSizing90();
        radius: 10
        anchors.top: kepanjanganAPPS.bottom
        anchors.topMargin:ModellingAndPositioning.variantTopMargin(11)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(4)

        Rectangle{
            id: loginIndicatorContainer
            objectName: "loginIndicatorContainer"
            anchors.fill: parent
            anchors.centerIn: parent
            color: "#404040"
            opacity: 0.7
            radius: 10
            visible: false

            BusyIndicator{
                id: loginIndicator
                objectName: "loginIndicator"
                anchors.centerIn: parent
                running: true
            }
        }

        Text {
            id: loginText
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
            text: "Masuk"
            color: "#1ebc10"
        }

        TextField{
            id: usernameInput
            width: parent.width - 2
            anchors.top: loginText.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(4)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Nama Pengguna..."
        }

        TextField {
            id: passwordInput
            width: parent.width - 2
            anchors.top: usernameInput.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(4)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Sandi..."
            echoMode: checkBox.checked === true? TextInput.Normal : TextInput.Password
        }

        CheckBox {
            id: checkBox
            text: qsTr("Tampilkan Password")
            anchors.top: passwordInput.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.left: parent.left
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
        }

        Text {
            id: warningText
            objectName: "warningText"
            anchors.top: checkBox.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            text: "Nama pengguna atau sandi salah!"
            color: "#e52626"
        }
        Text {
            id: warningText2
            objectName: "warningText"
            anchors.top: checkBox.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            text: "Data Masuk Tidak Lengkap"
            color: "#e52626"
        }

        Text {
            id: warningText1
            objectName: "warningText1"
            anchors.top: checkBox.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            text: "Tidak ada sambungan internet"
            color: "#e52626"
        }

        Rectangle {
            id: buttonSubmit
            width: ModellingAndPositioning.squareSizing70()
            height: ModellingAndPositioning.squareSizing10()
            anchors.bottom: parent.bottom
            anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(4)
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#1ebc10"
            radius: 10

            Text {
                id: submitButtonText
                anchors.centerIn: parent
                text: "Masuk"
                color: "white"
            }

            MouseArea {
                anchors.fill: parent

                onPressed:  {
                    buttonSubmit.color = "#41cd52"
                }

                onReleased: {
                    if(usernameInput.text.length > 0 && passwordInput.text.length > 0) {
                        warningText2.visible = false

                        buttonSubmit.color = "#1ebc10"
                        transmitLoginData(usernameInput.text, passwordInput.text)
                    }
                    else{
                        warningText2.visible = true
                    }
                }
            }
        }
    }
}
