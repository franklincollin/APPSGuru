import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Item {
    id: warningDialog
    width: ModellingAndPositioning.squareSizing60()
    height: ModellingAndPositioning.squareSizing60()
    visible: false

    Rectangle{
        id: internetWarningBox
        anchors.fill: parent
        color: "#404040"
        radius: 10
        opacity: 0.7

        Image{
            id: warningImage
            source: "/icons-64px/warning.png"
            anchors.top: parent.top
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text{
            id: internetWarningText
            width: parent.width
            text: "Terjadi Kesalahan"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            anchors.top: warningImage.bottom
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
        }

        Rectangle{
            id: buttonOk
            width: ModellingAndPositioning.squareSizing50()
            height: ModellingAndPositioning.variantSquareSizing(15)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(2)
            radius: 10

            Text {
                id: buttonText
                text: "OK"
                color: "#404040"
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    warningDialog.visible = false
                }
            }
        }
    }
}
