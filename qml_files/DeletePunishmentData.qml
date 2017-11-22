import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning

Rectangle {
    id: deleteDataLayout
    width: parent.width
    height: parent.height
    objectName: "deleteDataLayout"

    property string dataId
    property string studentName
    property string dateTimeLog
    property string pointValue
    property string completeInformation

    signal trigerStudentListing0(string triger0)
    signal trigerStudentDescription0(string arg0)
    signal trigerDeleteData0(string arg0)

    Rectangle {
        id:navbar
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

        Rectangle {
            id: navArrowIconContainer
            width: parent.height
            height: parent.height
            anchors.right: parent.right
            color: "#1ebc10"

            Image {
                id: navArrowIcon
                width: (parent.height / 100) * 60
                height: (parent.height / 100) * 60
                source: "icons/Icons/right-arrow.png"
                anchors.centerIn: parent
                antialiasing: true
            }

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    mainView.push(deleteAppreciation)
                }
            }
        }
    }

 Component {
     id: component

     Rectangle {
         id:component1
         width: parent.width
         height: studentName.height * 2

         Text {
             anchors.top: parent.top
             id: studentName
             text: "ID: " + modelData.dataID
         }

         Text {
             id: dateTime
             anchors.top: studentName.bottom
             text: "Waktu: " + modelData.name
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

 Rectangle {
     id: studentInputContainer
     width: ModellingAndPositioning.squareSizing90()
     height: ModellingAndPositioning.variantSquareSizing(10)
     anchors.top: parent.top
     anchors.topMargin: ModellingAndPositioning.variantTopMargin(11)
     anchors.horizontalCenter: parent.horizontalCenter

     TextField {
         id: studentInput
         anchors.left: parent.left
         anchors.right: searchIconContainer.left
         placeholderText: "Cari Berdasarkan NIS..."
         inputMethodHints: Qt.ImhFormattedNumbersOnly
     }

     Rectangle {
         id: searchIconContainer
         height: parent.height
         width: parent.height
         anchors.right: parent.right
         color: "#1ebc10"
         radius: 10

         Image {
             id: searchIcon
             //source: "icons/Icons/musica-searcher.png"
             width: ModellingAndPositioning.variantSquareSizing(7)
             height: ModellingAndPositioning.variantSquareSizing(7)
             anchors.left: parent.left
             anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(2)
             anchors.verticalCenter: parent.verticalCenter
             antialiasing: true
         }

         MouseArea {
             anchors.fill: parent

             onClicked: {
                 //myModel.clear()
                 trigerStudentListing0(studentInput.text)
                 punishedStudentListView.update()
             }
         }
     }
 }

 Rectangle {
     id: punishedStudentList
     width: ModellingAndPositioning.squareSizing90()
     height: ModellingAndPositioning.squareSizing60()
     anchors.horizontalCenter: parent.horizontalCenter
     anchors.top: studentInputContainer.bottom
     anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
     layer.enabled: true
     border.width: 1
     border.color: "#1ebc10"
     radius: 10

     Text {
         id: punishedStudentListTitle
         text: "Data Pelanggaran"
         anchors.top: parent.top
         anchors.horizontalCenter: parent.horizontalCenter
         layer.enabled: true
         color: "#1ebc10"
     }

     Rectangle {
         id: punishedStudentListContainer
         width: ModellingAndPositioning.squareSizing80()
         height: parent.height - punishedStudentListTitle.height
         anchors.bottom: parent.bottom
         anchors.bottomMargin: 1
         anchors.horizontalCenter: parent.horizontalCenter
         layer.enabled: true

         ListView {
             id: punishedStudentListView
             objectName: "punishedStudentListView"
             anchors.fill: parent
             delegate: component
             model: myModel
             spacing: ModellingAndPositioning.variantHeightSquareSizing(4)
         }
     }
 }

 Rectangle {
     id: additionalInformation
     width: punishedStudentList.width
     anchors.bottom: buttonnsContainer.top
     anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(2)
     anchors.horizontalCenter: parent.horizontalCenter
     anchors.top: punishedStudentList.bottom
     anchors.topMargin: ModellingAndPositioning.variantTopMargin(3)
     radius: 10
     border.width: 1
     border.color: "#1ebc10"

     Text {
         id: additionalInformationTitle
         text: "Keterangan"
         anchors.top: parent.top
         anchors.horizontalCenter: parent.horizontalCenter
         color: "#1ebc10"
     }

     Rectangle{
         id: additionalInformationContainer
         width: parent.width - 2
         height: parent.height - additionalInformationTitle.height - 7
         anchors.top: additionalInformationTitle.bottom
         anchors.horizontalCenter: parent.horizontalCenter

         ScrollView{
             id: additionalInformationScroll
             width: contentItem.width
             height: parent.height
             anchors.top: additionalInformationTitle.bottom
             anchors.horizontalCenter: parent.horizontalCenter
             contentItem: Rectangle{
                 id: additionalInformationView
                 width: additionalInformationContainer.width
                 anchors.horizontalCenter: parent.horizontalCenter
                 height: studentNameTitle.height + studentNameContainer.height + dateTimeTitle.height + dateTimeContainer.height
                         + pointTitle.height + pointContainer.height + informationTitle.height + informationContainer.height + 70

                 Text {
                     id: studentNameTitle
                     color: "#1ebc10"
                     text: "Nama"
                     anchors.top: parent.top
                     anchors.horizontalCenter: parent.horizontalCenter
                 }

                 Text {
                     id: studentNameContainer
                     objectName: "studentNameContainer"
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.top: studentNameTitle.bottom
                 }

                 Text{
                     id: dateTimeTitle
                     color: "#1ebc10"
                     text: "Tanggal/Waktu"
                     anchors.top: studentNameContainer.bottom
                     anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
                     anchors.horizontalCenter: parent.horizontalCenter
                 }

                 Text{
                     id: dateTimeContainer
                     objectName: "dateTimeContainer"
                     anchors.top: dateTimeTitle.bottom
                     anchors.horizontalCenter: parent.horizontalCenter
                 }

                 Text{
                     id: pointTitle
                     color: "#1ebc10"
                     anchors.top: dateTimeContainer.bottom
                     anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: "Pelanggaran"
                 }

                 Text{
                     id: pointContainer
                     objectName: "pointContainer"
                     width: ModellingAndPositioning.squareSizing90()
                     wrapMode: Text.WordWrap
                     anchors.top: pointTitle.bottom
                     anchors.horizontalCenter: parent.horizontalCenter
                     horizontalAlignment: Text.AlignHCenter
                 }

                 Text {
                     id: informationTitle
                     color: "#1ebc10"
                     anchors.top: pointContainer.bottom
                     anchors.topMargin: ModellingAndPositioning.variantTopMargin(2)
                     anchors.horizontalCenter: parent.horizontalCenter
                     text: "Keterangan"
                 }

                 Text {
                     id: informationContainer
                     width: ModellingAndPositioning.squareSizing90()
                     wrapMode: Text.WordWrap
                     objectName: "informationContainer"
                     anchors.top: informationTitle.bottom
                     anchors.horizontalCenter: parent.horizontalCenter
                     horizontalAlignment: Text.AlignHCenter
                 }
             }
         }
     }
 }

 Item {
     id: buttonnsContainer
     width: ModellingAndPositioning.squareSizing90()
     height: ModellingAndPositioning.squareSizing10()
     anchors.bottom: parent.bottom
     anchors.bottomMargin: ModellingAndPositioning.variantSquareSizing(4)
     anchors.horizontalCenter: parent.horizontalCenter

     Rectangle {
          id: buttonSubmit
          width: parent.width / 2 - 15
          height: parent.height
          color: "#41CD52"
          radius: 5
          anchors.left: parent.left

          Text {
              id: buttonSubmitText
              text: qsTr("Hapus")
              anchors.centerIn: parent
              color: "white"
          }

          MouseArea {
              anchors.fill: parent

              onPressed: {
                  buttonSubmit.color = "#404040"
              }
              onReleased: {
                  buttonSubmit.color = "#41cd52"
                  console.log("Data yang akan dihapus: " + dataId)
                  decisionDialog.visible = true
              }
          }
      }

      Rectangle {
          id: buttonCancel
          width: parent.width / 2 - 15
          height: parent.height
          color: "#41CD52"
          radius: 5
          anchors.right: parent.right

          Text {
              id: buttonCancelText
              text: qsTr("Batal")
              anchors.centerIn: parent
              color: "white"
          }

          MouseArea {
              anchors.fill: parent

              onClicked: {
                  mainAppLoader.active = true
                  mainAppLoader.focus = true
                  loadDeleteDataScreen.active = false
                  loadDeleteDataScreen.focus = false
              }
          }
      }
 }

 Rectangle {
     id: fetchingDataIndicatorContainer
     objectName: "fetchingDataIndicatorContainer"
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

 Rectangle{
     id: decisionDialog
     width: ModellingAndPositioning.squareSizing80()
     height: ModellingAndPositioning.squareSizing60()
     anchors.centerIn: parent
     color: "#404040"
     radius: 10
     opacity: 0.7
     visible: false

     Text{
         id: earlyWarning
         width: parent.width
         text: "Anda Yakin Ingin Menghapus Data? Data Yang Dihapus Tidak Dapat Dikembalikan Seperti Semula"
         horizontalAlignment: Text.AlignHCenter
         anchors.top: parent.top
         anchors.topMargin: ModellingAndPositioning.variantTopMargin(1)
         anchors.horizontalCenter: parent.horizontalCenter
         color: "white"
         wrapMode: Text.WordWrap
     }

     Item {
         id: decisionButtonContainer
         width: parent.width
         height: ModellingAndPositioning.variantSquareSizing(15)
         anchors.bottom: parent.bottom
         anchors.bottomMargin: ModellingAndPositioning.variantTopMargin(3)
         anchors.horizontalCenter: parent.horizontalCenter

         Rectangle{
             id: decisionButtonYes
             width: ModellingAndPositioning.squareSizing30()
             height: parent.height
             anchors.left: parent.left
             anchors.leftMargin: ModellingAndPositioning.variantHorizontalMargin(3)
             color: "white"
             radius: 10

             Text{
                 id: decisionButtonYesText
                 text: "YA"
                 color: "#404040"
                 anchors.centerIn: parent
             }

             MouseArea{
                 anchors.fill: parent

                 onClicked: {
                     decisionDialog.visible = false
                     trigerDeleteData0(dataId)
                 }
             }
         }

         Rectangle{
             id:decisionButtonCancel
             width: ModellingAndPositioning.squareSizing30()
             height: parent.height
             anchors.right: parent.right
             anchors.rightMargin: ModellingAndPositioning.variantHorizontalMargin(3)
             color: "white"
             radius: 10

             Text{
                 id: decisionButtonCancelText
                 text: "BATAL"
                 color: "#404040"
                 anchors.centerIn: parent
             }

             MouseArea {
                 anchors.fill: parent

                 onClicked: {
                     decisionDialog.visible = false
                 }
             }
         }
     }
 }

 InternetWarningDialog{
     objectName: "internetWarningDialog"
     anchors.centerIn: parent
 }

 EmptyDataWarning{
     objectName: "emptyDataWarning"
     anchors.centerIn: parent
 }

 OpacityAnimator {
     target: deleteDataLayout
     from: 0
     to: 1
     duration: 300
     running: true
 }

 BlackBackgroud{
     id: blackBackGround
 }

 PunishedStudentDescription{
     id: punishedStudentDescription
     objectName: "punishedStudentDescription"
 }

 Component.onCompleted: {
     if(parent.width >= 310) {
         searchIcon.source = "/icons-32px/005-magnifying-glass-icon.png"
     }
 }
}
