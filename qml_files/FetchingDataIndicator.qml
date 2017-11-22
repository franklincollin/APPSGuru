import QtQuick 2.0
import QtQuick.Controls 2.2
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: fetchingDataIndicatorContainer
    width: ModellingAndPositioning.squareSizing40()
    height: ModellingAndPositioning.squareSizing40()
    color: "#404040"
    anchors.centerIn: parent
    radius: 10
    opacity: 0.7
    visible: false

    BusyIndicator {
        id: fetchingDataIndicator
        objectName: "fetchingDataIndicator"
        anchors.centerIn: parent
        running: true
    }

    Text {
        id: fetchingDataIndicatorText
        width: parent.width
        anchors.top: fetchingDataIndicator.bottom
        anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        //text: "Mengambil Data"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
    }
}
