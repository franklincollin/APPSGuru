import QtQuick 2.7
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: completeAdditionalInformation
    anchors.centerIn: parent
    radius: 10
    visible: false

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

    Text{
        id: pointContainer
        objectName: "pointContainer"
        anchors.top: pointTitle.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: informationTitle
        color: "#1ebc10"
        anchors.top: pointContainer.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Keterangan: "
    }

    Text {
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

    onWidthChanged: {
        studentNameContainer.text = studentName
        dateTimeContainer.text = dateTimeLog
        pointContainer.text = pointValue
        informationContainer.text = completeInformation
    }
}
