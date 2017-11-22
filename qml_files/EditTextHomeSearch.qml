import QtQuick 2.7
import QtQuick 2.0

Item {

    TextEdit {
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        horizontalAlignment: Text.horizontalAlignment
        verticalAlignment: Text.verticalAlignment
        text: qsTr("Fuck this TextEdit")

        Rectangle {
            anchors.fill: parent
            anchors.margins: -10
            color: "transparent"
            border.width: 1
        }
    }
}
