import QtQuick 2.6
import QtQml 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: appMain
    objectName: "appMain"
    width: parent.width
    height: parent.height
    signal studentSearchText(string txt1)
    signal loadDeleteDataLayout(string showLayout)

    Navbar {
        id: topNavbar
        anchors.top: parent.top
        opacity: 2.5
    }

    NavFragment {
        id: navFragment
        anchors.top: fragmentContainer.bottom
        opacity: 2.5

        TabIndicator{
            id: tabIndicator
            x: 0
            Behavior on x {

                NumberAnimation {
                    duration: 150
                    easing.type: Easing.Linear
                }
            }
        }
    }

Rectangle {
    id: fragmentContainer
    width: mainWindow.width
    height: mainWindow.height - (topNavbar.height + navFragment.height)
    anchors.top: topNavbar.bottom

    ///////////////////////////////!WARNING! SUPER SENSITIVE CODE///////////////////////////////
    //Change this code without any understanding about the codes would cause several heavy damages
    //Merubah kode tanpa pengetahuan/pengertian mengenai kode yang tertulis dapat menyebabkan beberapa kerusakan parah
    FragmentHome{
        id: fragmentHome
        width: parent.width
        height: fragmentContainer.height
        x: 0

        Behavior on x {

            NumberAnimation {
                duration: 150
                easing.type: Easing.Linear
            }
        }

        Rectangle{
            id: teacherActivityLog
            width: parent.width
            height: parent.height
            layer.enabled: true

            ListView{
                id: teacherActivityLogList
                width: parent.width
                height: parent.height
                spacing: ModellingAndPositioning.variantHeightSquareSizing(4)
                model: teacherLogList
                delegate: Rectangle {
                    id:component1
                    width: parent.width
                    height: studentName.height * 2

                    Image {
                        id: informationIcon
                        source: "/icons-32px/information_more_detail-32.png"
                        anchors.left: parent.left
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        id: studentName
                        anchors.top: parent.top
                        text: modelData.dataID
                        anchors.left: informationIcon.right
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                    }

                    Text{
                        id: dateTime
                        anchors.top: studentName.bottom
                        text: modelData.name
                        anchors.left: informationIcon.right
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            console.log(studentName.text)
                            trigerStudentDescription0(studentName.text)
                            dataId = modelData.dataID
                        }
                    }
                }
            }
        }

        FetchingDataIndicator{
//            id: fetchingDataIndicatorContainer
            objectName: "fetchingDataIndicatorContainer"
        }

        WarningDialog{
            anchors.centerIn: parent
            objectName: "warningDialog"
        }
    }

    FragmentEdit{
        id: fragmentEdit
        objectName: "fragmentEdit"
        width: parent.width
        height: fragmentContainer.height
        x: fragmentContainer.width

        Behavior on x {

            NumberAnimation {
                duration: 150
                easing.type: Easing.Linear
            }
        }

        FragmentEditMenu {
            id: editMenu
            width: parent.width
            height: parent.height
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    FragmentView {
        id: fragmentView
        width: parent.width
        height: fragmentContainer.height
        x: fragmentContainer.width * 2

        TextField{
            id: studentInput
            placeholderText: "Cari Siswa"
            width: ModellingAndPositioning.variantSquareSizing(95)
            height: ModellingAndPositioning.variantHeightSquareSizing(7)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)

            Image{
                id: searcIcon
                objectName: "searcIcon"
                source: "/icons-32px/005-magnifying-glass-icon.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(1)
            }

            BusyIndicator{
                id: searchProcessIndicator
                objectName: "searchProcessIndicator"
                width: parent.height - 2
                height: parent.height - 2
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                running: false
            }

            onTextChanged: {
                timer.restart()
            }
        }

        Rectangle{
            id: studentList
            width: parent.width
            height: parent.height - (studentInput.height * 2) - ModellingAndPositioning.variantHeightSquareSizing(2)
            anchors.bottom: parent.bottom
            layer.enabled: true

            ListView{
                id: studenListView
                anchors.fill: parent
                model: studentListModel
                spacing: ModellingAndPositioning.variantHeightSquareSizing(4)
                delegate: Rectangle {
                    id:component2
                    width: parent.width
                    height: studentName1.height * 2

                    Image {
                        id: studentPicture
                        source: "https://appsapis.000webhostapp.com/studentPhotoProfile/" + modelData.picture
                        width: parent.height
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                        anchors.verticalCenter: parent.verticalCenter
                        asynchronous: true
                        fillMode: Image.PreserveAspectCrop
                        layer.enabled: true
                        layer.effect: OpacityMask{
                            maskSource: roundImageFrame2
                        }
                    }

                    Text {
                        id: studentName1
                        anchors.top: parent.top
                        text: modelData.name
                        anchors.left: studentPicture.right
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                    }

                    Text{
                        id: nis
                        anchors.top: studentName1.bottom
                        text: modelData.dataID
                        anchors.left: studentPicture.right
                        anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
                    }

                    Rectangle {
                        id: roundImageFrame2
                        width: studentPicture.width
                        height: studentPicture.height
                        radius: studentPicture.width / 2
                        visible: false
                    }
                }
            }
        }

        WarningDialog{
            anchors.centerIn: parent
            objectName: "warningDialog"
        }

        Timer{
            id: timer
            interval: 700
            running: true
            repeat: false
            onTriggered: {
                searcIcon.visible = false
                searchProcessIndicator.running = true
                console.log("Timer is stop")
                studentSearchText(studentInput.text)
            }
        }

        Behavior on x {

            NumberAnimation {
                duration: 150
                easing.type: Easing.Linear
            }
        }

        Rectangle{
            id: studenList
            width: parent.width
            height: studentInput.height
            anchors.top: studentInput.bottom
        }
    }
}
///////////////////////////////!WARNING! SUPER SENSITIVE CODE (END)///////////////////////////////
}
