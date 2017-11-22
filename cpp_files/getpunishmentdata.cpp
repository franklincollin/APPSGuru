#include "getpunishmentdata.h"
#include "httpraction.h"
#include <QTime>
#include <QDateTime>
#include <QTimeZone>
#include <QQmlProperty>

GetPunishmentData::GetPunishmentData(QObject *parent) : QObject(parent)
{

}

void GetPunishmentData::getPunishmentStrings(const QString data, int data1, const QString data2, const QString data3) {
    QDateTime dateTime;

    QString currentDateTime = dateTime.currentDateTime().toString(Qt::ISODate);
    QString punishmentID = QString::number(data1);

    setWarningMessageInvisible(this->anObject);
    setWarningMessageInternetInvisible(this->anObject);
    setSendDataIndicatorRun(this->anObject);

    QUrl url("https://appsapis.000webhostapp.com/InputDataScript/inputPunishmentData.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("studentName", "punishment", "information", "dateTime", "schoolCode", "nuptk");
    httpRAction.httpValue(data, punishmentID, data2, currentDateTime, data3, QQmlProperty::read(this->anObject, "nuptk").toString());
    httpRAction.httpExec();

    if(!httpRAction.NetworkError){
        setSendDataIndicatorStop(this->anObject);

        if(httpRAction.httpStringResponse() == "action-true"){
            qDebug() << httpRAction.httpStringResponse();
            qDebug() << "Success";
        }
        else{
            qDebug() << httpRAction.httpStringResponse();
            setWarningMessageVisible(this->anObject);
        }
    }
    else{
        setWarningMessageInvisible(this->anObject);
        setWarningMessageInternetVisible(this->anObject);
        setSendDataIndicatorStop(this->anObject);
    }
}

void GetPunishmentData::setObject(QObject *anObjectOrItem){
    this->anObject = anObjectOrItem;
}

void GetPunishmentData::setSendDataIndicatorRun(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("sendDataIndicatorContainer");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void GetPunishmentData::setSendDataIndicatorStop(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("sendDataIndicatorContainer");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void GetPunishmentData::setWarningMessageVisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageStudentData");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void GetPunishmentData::setWarningMessageInvisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageStudentData");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void GetPunishmentData::setWarningMessageInternetVisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageInternet");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void GetPunishmentData::setWarningMessageInternetInvisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageInternet");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void GetPunishmentData::setEditFragmentDefault(){
    QObject *result = this->anObject->findChild<QObject*>("fragmentEdit");

    if(result) {
        result->setProperty("x", "0");
    }
    else{
        qDebug() << "Gagal";
    }
}
