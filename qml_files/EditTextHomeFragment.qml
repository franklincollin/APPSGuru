import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4

    TextField {
        id: homeFragmentInput
        anchors.horizontalCenter: fragmentHome.horizontalCenter
        anchors.top: fragmentHome.top
        anchors.topMargin: 20
        width: fragmentHome.width - 40
        layer.enabled: true
        placeholderText: "Cari..."
        anchors.rightMargin: 10
        signal transmitStudentSearch(string student_name)

        onTextChanged: {
            console.log(qsTr("String from home fragment: " + homeFragmentInput.text))
            homeFragmentInput.transmitStudentSearch(homeFragmentInput.text)
        }

        Image {
            id: searchIcon
            source: "icons/Icons/musica-searcher.png"
            width: homeFragmentInput.height - 10
            height: homeFragmentInput.height - 10
            anchors.right: parent.right
            anchors.margins: 10
            //anchors.rightMargin: 10
        }
    }

