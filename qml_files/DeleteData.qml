//DeletePunishmentData{
//    width: parent.width
//    height: parent.height
//}

import QtQuick.Controls 1.4
import QtQuick 2.7

StackView {
    id: mainView
    anchors.fill: parent

    signal trigerStudentListing1(string triger1)
    signal trigerStudentDescription1(string arg1)
    signal trigerDeleteData1(string dataID)

    signal trigerStudentListing11(string triger1)
    signal trigerStudentDescription11(string arg1)
    signal trigerDeleteData11(string dataID)

    Component{
        id: deletePunishment
        DeletePunishmentData{
            id: deletePunishmentData

            onTrigerStudentListing0: {
                trigerStudentListing1(triger0)
            }

            onTrigerStudentDescription0: {
                trigerStudentDescription1(arg0)
            }

            onTrigerDeleteData0: {
                trigerDeleteData1(arg0)
            }
        }
    }

    Component{
        id: deleteAppreciation
        DeleteAppreciationData{id: deleteAppreciationdata
            onTrigerStudentListing01: {
                trigerStudentListing11(triger0)
            }

            onTrigerStudentDescription01: {
                trigerStudentDescription11(arg0)
            }

            onTrigerDeleteData01: {
                trigerDeleteData11(arg0)
            }
        }
    }

    Component.onCompleted: mainView.push(deletePunishment)
}
