import QtQuick 2.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Item {
    id: internetWarningDialog
    width: ModellingAndPositioning.squareSizing60()
    height: ModellingAndPositioning.squareSizing50()
    visible: false

    Rectangle{
        id: internetWarningBox
        anchors.fill: parent
        color: "#404040"
        radius: 10
        opacity: 0.7

        Text{
            id: internetWarningText
            width: parent.width
            text: "Tidak Ada Sambungan Internet"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
            anchors.horizontalCenter: parent.horizontalCenter
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
                    internetWarningDialog.visible = false
                }
            }
        }
    }
}
