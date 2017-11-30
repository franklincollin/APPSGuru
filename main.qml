import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import "js/modellingAndPositioning.js" as ModellingAndPositioning
import "js/apps.js" as Apps
import "UniversalComponent"
import "Layout"
import "SpecialComponent"

Window {
    id: mainWindow
    visible: true
    width: 480 / 1.5
    height: 816 / 1.5
    title: qsTr("APPS")

    //////////////////////////////WARNING//////////////////////////////
    /*VITAL SIGNAL! DO NOT CHANGE OR MODIFY IF YOU DON'T UNDERSTAND THE WORK OF THE SIGNAL!*/

    //SECTOR 0
    signal passAppreciationStudentData(string data, int data1, string data2, string data3);
    signal passStudentSearchBox(string fragmentHomeSearchQuery)
    signal passPunishmentPointInputData(string param, int param1, string param2, string param3)
    signal passLoginData(string param, string param1)

    //SECTOR 1
    signal sendFailLogin(string fail)
    signal passTrigerStudentListing(string data, string arg)
    signal passDeleteLayoutCommand();
    signal generateStudentList(string studentList);

    //SECTOR 2
    signal passStudentDescription(string dataID, string arg)
    signal sendStudentDescription(string arg0, string arg1, string arg2)
    signal passProfileDetail()
    signal deletePunishmentData(string arg0)

    //SECTOR 3
    signal setFragmentEditDefault()
    signal passTrigerStudentListing1(string data, string arg)
    signal passStudentDescription1(string dataID, string arg)
    signal deleteAppreciationData(string arg0)

    //SECTOR 4
    signal trigerStudentListingUpdate1(string dataid, string arg)
    signal trigerStudentDescriptionUpdate1(string dataID, string arg)
    signal trigerStudentDescriptionUpdate2(string dataID, string arg)
    signal tryUpdatePunishmentData(string arg0, string arg1, string arg2, string arg3, string arg4)

    //SECTOR 5
    signal tryUpdateAppreciationData(string arg0, string arg1, string arg2, string arg3, string arg4)
    signal trigerStudentListingUpdate2(string dataid, string arg)
    signal tryTeacherActivityLogListing()
    signal logout(string username)

    //APPS GLOBAL VARIABLE (DO NOT CHANGE!)
    property string schoolCodes
    property string nuptk
    property string teacherCompleteName
    property string teacherBirth
    property string motivation
    property string teacherProfilePicture
    property string dateTimeLog
    property string information
    property string teacherUsername

    //SLOT
    function receiveHTTPResponse(httpResponse, schoolCode, teacherNUPTK,
                                 teacherName, teacherBirthDay, motivationText, teacherProfile, username) {
                loginLayoutLoader.active = false
                loginLayoutLoader.focus = false
                mainAppLoader.active = true
                mainAppLoader.focus = true

        console.log("HTTP data from receiveHTTPResponse(): " + httpResponse)
        schoolCodes = schoolCode
        nuptk = teacherNUPTK
        teacherCompleteName = teacherName
        teacherBirth = teacherBirthDay
        motivation = motivationText
        teacherUsername = username
        teacherProfilePicture = teacherProfile
        console.log("School Code (main.qml): " + schoolCodes)
        console.log("NUPTK Guru: " + nuptk)
        console.log("Nama Guru: " + teacherCompleteName)
        console.log("Tanggal Lahir Guru: " + teacherBirth)
        console.log("Motivasi: " + motivation)
        console.log("Profile Picture: " + teacherProfilePicture)
        console.log("Username: " + teacherUsername)

        tryTeacherActivityLogListing()
    }

    function commandCreateStudentListing(studentlist) {
        console.log(studentlist)
        mainWindow.generateStudentList("Per;cobaan")
    }

    function goToLoginlayout(){
        loginLayoutLoader.active = true
        loginLayoutLoader.focus = true
        mainAppLoader.active = false
        mainAppLoader.focus = false

        console.log("Go to login Layout")
    }

    //END

    Drawer {
        id: appDrawer
        width: (mainWindow.width / 3) * 2
        height: mainWindow.height

        DrawerHeader {
            id: drawerHeader
            anchors.top: parent.top
        }

        DrawerMenuProfile {
            id: drawerMenuProfile
            anchors.top: drawerHeader.bottom
            anchors.topMargin: drawerMenuProfile.height

            onSetProfileDetail: {
                console.log(arg0)
                passProfileDetail()
            }
        }

        DrawerMenuSettings {
            id: drawerMenuSetting
            anchors.top: drawerMenuProfile.bottom
            anchors.topMargin: drawerMenuSetting.height
        }

        DrawerMenuAbout {
            id: drawerMenuAbout
            anchors.top: drawerMenuSetting.bottom
            anchors.topMargin: drawerMenuAbout.height
        }

        DrawerMenuLogout{
            id: drawerMenuLogout
            anchors.top: drawerMenuAbout.bottom
            anchors.topMargin: drawerMenuLogout.height

            MouseArea{
                anchors.fill: parent

                onClicked: {
                    logoutWarning.visible = true
                    appDrawer.close()
                }
            }
        }
    }

    Loader {
        id: loginLayoutLoader
        objectName: "loginLayoutLoader"
        width: parent.width
        height: parent.height
        source: "Layout/LoginLayout.qml"
        focus: true

        Connections {
            target: loginLayoutLoader.item
            onTransmitLoginData: {
                console.log("String from LoginLayout: " + username + ", " + password)
                passLoginData(username, password)
            }
        }
    }

    Loader {
        id: mainAppLoader
        objectName: "mainAppLoader"
        width: parent.width
        height: parent.height
        source: "Layout/App.qml"
        focus: true
        active: false

        Connections {
            target: mainAppLoader.item
            onStudentSearchText: {
                passStudentSearchBox(txt1)
                console.log("string from mainAppLoader: " + txt1)
            }
        }
    }

    LogoutWarning{
        id: logoutWarning
        objectName: "logoutWarning"
        anchors.centerIn: parent
        onGetClicked: {
            fetchingDataIndicator.visible = true
            mainWindow.logout(teacherUsername)
        }
    }

    FetchingDataIndicator{
        id: fetchingDataIndicator
        objectName: "fetchingDataIndicator"
        anchors.centerIn: parent
    }

    WarningDialog{
        id: warningDialog
        objectName: "warningDialog"
        anchors.centerIn: parent
    }

    Loader {
        id: loadPunishmentLayout
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadPunishmentLayout.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadPunishmentLayout.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - kontol kau !")
                event.accepted = true

                if(loadPunishmentLayout.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadPunishmentLayout.active = false
                    loadPunishmentLayout.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }

        Connections {
            target: loadPunishmentLayout.item
            onTransmitPunishmentInputData: {
                console.log("Data from loadPunishmentLayout: " + nameStudent + punishment + information)
                passPunishmentPointInputData(nameStudent, punishment, information, schoolCodes)
            }

            onTransmitSetFragmentEditDefault: {
                setFragmentEditDefault()

                console.log("onTransmitSetFragmentEditDefault")

                if(mainAppLoader.status == Loader.Ready) {
                    fragmentEdit.x = 0
                }
            }
        }
    }

    Loader {
        id: loadAppreciationLayout
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadAppreciationLayout.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadAppreciationLayout.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                event.accepted = true

                if(loadAppreciationLayout.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadAppreciationLayout.active = false
                    loadAppreciationLayout.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }

        Connections {
            target: loadAppreciationLayout.item
            onTransmitStudentData: {
                console.log(studentName)
                passAppreciationStudentData(studentName, appreciation, information, schoolCodes)
            }
        }
    }

    Loader {
        id: loadDeleteDataScreen
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadDeleteDataScreen.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadDeleteDataScreen.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - wunderbar !")
                event.accepted = true

                if(loadDeleteDataScreen.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadDeleteDataScreen.active = false
                    loadDeleteDataScreen.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }

        Connections {
            target: loadDeleteDataScreen.item

            onTrigerStudentListing1: {
                passTrigerStudentListing(triger1, schoolCodes)
            }

            onTrigerStudentDescription1: {
                passStudentDescription(arg1, schoolCodes)
            }

            onTrigerDeleteData1: {
                deletePunishmentData(dataID)
            }

            onTrigerStudentListing11: {
                passTrigerStudentListing1(triger1, schoolCodes)
            }

            onTrigerStudentDescription11: {
                passStudentDescription1(arg1, schoolCodes)
            }

            onTrigerDeleteData11: {
                deleteAppreciationData(dataID)
            }
        }
    }

    Loader {
        id: loadUpdateDataLayout
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadUpdateDataLayout.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadUpdateDataLayout.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - wunderbar !")
                event.accepted = true

                if(loadUpdateDataLayout.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadUpdateDataLayout.active = false
                    loadUpdateDataLayout.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }

        Connections{
            target: loadUpdateDataLayout.item

            onTrigerStudentListingUpdate: {
                console.log("NIS: " + triger1)
                trigerStudentListingUpdate1(triger1, schoolCodes)
            }

            onTrigerStudentDescriptionUpdate: {
                trigerStudentDescriptionUpdate1(arg1, schoolCodes)
            }
            onTryUpdateData0:{
                console.debug("Triger update data: " + nis + schoolCodes + dataID + punishmentID + detailInformation)
                tryUpdatePunishmentData(nis, schoolCodes, dataID, punishmentID, detailInformation)
            }

            onTrigerStudentListingUpdate1: {
                trigerStudentListingUpdate2(triger1, schoolCodes)
            }
            onTrigerStudentDescriptionUpdate1: {
                trigerStudentDescriptionUpdate2(arg1, schoolCodes)
            }

            onTryUpdateData1: {
                tryUpdateAppreciationData(nis, schoolCodes, dataID, appreciationID, detailInformation)
            }
        }
    }

    Loader {
        id: loadProfileLayout
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadProfileLayout.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadProfileLayout.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - wunderbar !")
                event.accepted = true

                if(loadProfileLayout.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadProfileLayout.active = false
                    loadProfileLayout.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }

        Connections{
            target: loadProfileLayout.item

            onSetProfileDetail: {
                console.log(arg0)
            }
        }
    }

    Loader {
        id: loadAboutLayout
        anchors.fill: parent
        focus: true
        onStatusChanged: {

            if(loadAboutLayout.status == Loader.Ready) {
                mainAppLoader.active = false
                appDrawer.interactive = false
                loadAboutLayout.focus = true
            }
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Back) {
                console.log("Back button captured - wunderbar !")
                event.accepted = true

                if(loadAboutLayout.status == Loader.Ready) {
                    console.log("Back to previous layout")
                    loadAboutLayout.active = false
                    loadAboutLayout.focus = false
                    mainAppLoader.active = true
                    mainAppLoader.focus = true
                    appDrawer.interactive = true
                }
                else {
                    console.log("Loader not ready")
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("WIDTH: " + mainWindow.width)
        console.log("HEIGHT: " + mainWindow.height)
    }
}
