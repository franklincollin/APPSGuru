import QtQuick 2.7
import "modellingAndPositioning.js" as ModellingAndPositioning

Item{
    id: punishedStudentData
    visible: false
    anchors.centerIn: parent

    Rectangle{
        id: darkBackground
        anchors.fill: parent
        color: "#404040"
        opacity: 0.7
    }
}
