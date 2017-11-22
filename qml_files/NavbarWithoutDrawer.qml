import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height / 12
    color: "#1ebc10"
    anchors.top: parent.top

    Text {
        text: "APPS"
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        color: "white"
    }
}
