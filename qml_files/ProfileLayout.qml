import QtQuick 2.0
import QtGraphicalEffects 1.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: profileLayout
    width: parent.width
    height: parent.height

    Image {
        id: profilePicture
        objectName: "profilePicture"
        width: ModellingAndPositioning.profileImage()
        height: ModellingAndPositioning.profileImage()
        fillMode: Image.PreserveAspectCrop
        anchors.top: parent.top
        anchors.topMargin: parent.height / 25
        anchors.horizontalCenter: parent.horizontalCenter
        layer.enabled: true
        layer.effect: OpacityMask{
            maskSource: roundImageFrame
        }
        asynchronous: true
    }

    Rectangle {
        id: roundImageFrame
        width: profilePicture.width
        height: profilePicture.height
        radius: profilePicture.width / 2
        visible: false
    }

    Text {
        id: name
        objectName: "name"
        //text: "Example Name Text"
        anchors.top: profilePicture.bottom
        anchors.topMargin: parent.height / 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: motivationBox
        width: parent.width - 15
        height: parent.height / 20
        anchors.top: name.bottom
        anchors.topMargin: parent.height / 30
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 1
        border.color: "#1ebc10"
        radius: 5

        Text {
            id: motivationText
            objectName: "motivationText"
            text: qsTr("Motivation Text")
            anchors.centerIn: parent
            color: "#2c6700"
        }
    }

    Rectangle {
        id: profileDetail
        width: parent.width - 15
        height: parent.height / 3
        anchors.top: motivationBox.bottom
        anchors.topMargin: parent.height / 30
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 1
        border.color: "#1ebc10"
        radius: 5
        layer.enabled: true

        Text {
            id: additionalInformationTitleText
            text: qsTr("Informasi Pribadi")
            anchors.top: parent.top
            anchors.topMargin: parent.height / 20
            anchors.horizontalCenter: parent.horizontalCenter
            //Text.horizontalCenter: Text.horizontalCenter
            color: "#2c6700"
        }

        Text{
            id: birthDayTitle
            text: "Tanggal Lahir: "
            anchors.top: additionalInformationTitleText.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.left: parent.left
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(1)
            color: "#1ebc10"
        }

        Text {
            id: birthDay
            objectName: "birthDay"
            text: "Test"
            anchors.top: additionalInformationTitleText.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.left: birthDayTitle.right
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(1)
        }

        Text {
            id: nuptkTitle
            text: "NUPTK: "
            anchors.top: birthDayTitle.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
            anchors.left: parent.left
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(1)
            color: "#1ebc10"
        }

        Text{
            id: nuptk
            objectName: "nuptk"
            text: "Test"
            anchors.top: birthDayTitle.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
            anchors.left: nuptkTitle.right
            anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(1)
        }
    }
}
