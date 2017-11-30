#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QtQuick>
#include <QtConcurrent/QtConcurrent>
#include <QQmlComponent>
#include "getappreciationdata.h"
#include "getpunishmentdata.h"
#include "httplogin.h"
#include "studentlisting.h"
#include "profiledetail.h"
#include "studentlisting.h"
#include "studentlisting1.h"
#include "updatedata.h"
#include "updatedata1.h"
#include "fragmenthome.h"
#include "fragmentview.h"
#include "httplogout.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    QObject * item = engine.rootObjects().value(0);
    GetAppreciationData getAppreciationData;
    GetPunishmentData getPunishmentData;
    HTTPLogin httplogin;
    StudentListing studentListing(engine.rootContext(), item);
    StudentListing1 studentListing1(engine.rootContext(), item);
    UpdateData updateData(engine.rootContext(), item);
    UpdateData1 updateData1(engine.rootContext(), item);
    ProfileDetail profileDetail;
    FragmentHome fragmentHome(engine.rootContext(), item);
    FragmentView fragmentView(engine.rootContext(), item);
    HTTPLogout httplogout(item);

    httplogin.setObject(item);
    getPunishmentData.setObject(item);
    profileDetail.setObjectOrItem(item);
    getAppreciationData.setObjectOrItem(item);

    //0
    QObject::connect(item, SIGNAL(passAppreciationStudentData(QString, int, QString, QString)), &getAppreciationData, SLOT(getAppreciationData(QString,int,QString, QString)));
    //1
    QObject::connect(item, SIGNAL(tryTeacherActivityLogListing()), &fragmentHome, SLOT(teacherActivityLogListing()));
    //2
    QObject::connect(item, SIGNAL(passPunishmentPointInputData(QString, int, QString, QString)), &getPunishmentData, SLOT(getPunishmentStrings(QString,int,QString, QString)));
    //3
    QObject::connect(item, SIGNAL(passLoginData(QString, QString)), &httplogin, SLOT(getLoginData(QString,QString)));
    //4
    QObject::connect(&httplogin, SIGNAL(sendHTTPResponse(QVariant, QVariant, QVariant, QVariant, QVariant, QVariant, QVariant, QVariant)),
                     item, SLOT(receiveHTTPResponse(QVariant, QVariant, QVariant, QVariant, QVariant, QVariant, QVariant, QVariant)));
    //5
    QObject::connect(item, SIGNAL(passTrigerStudentListing(QString, QString)), &studentListing, SLOT(receiveStudentListing(QString, QString)));
    //6
    QObject::connect(&studentListing, SIGNAL(makeStudentListing(QVariant)), item, SLOT(commandCreateStudentListing(QVariant)));
    //7
    QObject::connect(item, SIGNAL(passStudentDescription(QString, QString)), &studentListing, SLOT(receiveStudentDataID(QString, QString)));
    //8
    QObject::connect(item, SIGNAL(passProfileDetail()), &profileDetail, SLOT(setProfileDetail()));
    //9
    QObject::connect(item, SIGNAL(deletePunishmentData(QString)), &studentListing, SLOT(deletePunishmentData(QString)));
    //10
    QObject::connect(item, SIGNAL(setFragmentEditDefault()), &getPunishmentData, SLOT(setEditFragmentDefault()));
    //11
    QObject::connect(item, SIGNAL(passTrigerStudentListing1(QString, QString)), &studentListing1, SLOT(receiveStudentListing(QString,QString)));
    //12
    QObject::connect(item, SIGNAL(passStudentDescription1(QString, QString)), &studentListing1, SLOT(receiveStudentDataID(QString,QString)));
    //13
    QObject::connect(item, SIGNAL(deleteAppreciationData(QString)), &studentListing1, SLOT(deleteAppreciationData(QString)));
    //14
    QObject::connect(item, SIGNAL(trigerStudentListingUpdate1(QString, QString)), &updateData, SLOT(receiveStudentListing(QString,QString)));
    //15
    QObject::connect(item, SIGNAL(trigerStudentDescriptionUpdate1(QString, QString)), &updateData, SLOT(receiveStudentDataID(QString,QString)));
    //16
    QObject::connect(item, SIGNAL(tryUpdatePunishmentData(QString, QString, QString, QString, QString)), &updateData, SLOT(updatePunishmentData(QString,QString,QString,QString,QString)));
    //17
    QObject::connect(item, SIGNAL(trigerStudentListingUpdate2(QString, QString)), &updateData1, SLOT(receiveStudentListing(QString,QString)));
    //18
    QObject::connect(item, SIGNAL(trigerStudentDescriptionUpdate2(QString, QString)), &updateData1, SLOT(receiveStudentDataID(QString,QString)));
    //19
    QObject::connect(item, SIGNAL(tryUpdateAppreciationData(QString, QString, QString, QString, QString)), &updateData1, SLOT(updateAppreciationData(QString,QString,QString,QString,QString)));
    //20
    QObject::connect(item, SIGNAL(passStudentSearchBox(QString)), &fragmentView, SLOT(studentDataListing(QString)));
    //21
    QObject::connect(item, SIGNAL(logout(QString)), &httplogout, SLOT(logoutProcess(QString)));
    //22
    QObject::connect(&httplogout, SIGNAL(changeToLoginLayout()), item, SLOT(goToLoginlayout()));

    return app.exec();
}

