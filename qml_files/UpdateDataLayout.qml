import QtQuick 2.7
import QtQuick.Controls 1.4
import "modellingAndPositioning.js" as ModellingAndPositioning

StackView{
    id: updateDataLayoutStackView
    anchors.fill: parent

    signal trigerStudentListingUpdate(string triger1)
    signal trigerStudentDescriptionUpdate(string arg1)
    signal tryUpdateData0(string dataID, string nis, string punishmentID, string detailInformation)


    signal trigerStudentListingUpdate1(string triger1)
    signal trigerStudentDescriptionUpdate1(string arg1)
    signal tryUpdateData1(string dataID, string nis, string appreciationID, string detailInformation)

    Component{
        id: updatePunishmentDataView

        UpdatePunishmentData{
            id: updatePunishmentData

            onTrigerStudentListing0: {
                trigerStudentListingUpdate(triger0)
            }
            onTrigerStudentDescription0: {
                trigerStudentDescriptionUpdate(arg0)
            }
            onTrigerUpdateData0: {
                console.log("Data: " + arg0 + arg1 + arg2 + arg3)
                tryUpdateData0(arg0, arg1, arg2, arg3)
            }
        }
    }

    Component{
        id: updateAppreciationDataView

        UpdateAppreciationData{
            id: updateAppreciationData

            onTrigerStudentListing1: {
                trigerStudentListingUpdate1(triger0)
            }

            onTrigerStudentDescription1: {
                trigerStudentDescriptionUpdate1(arg0)
            }

            onTrigerUpdateData1: {
                tryUpdateData1(arg0, arg1, arg2, arg3)
            }
        }
    }

    Component.onCompleted: {
        updateDataLayoutStackView.push(updatePunishmentDataView)
    }
}
