#include "getappreciationdata.h"
#include "httpraction.h"
#include <QQuickView>
#include <QQuickItem>
#include <QDate>
#include <QTime>
#include <QDateTime>
#include <QQmlProperty>

GetAppreciationData::GetAppreciationData(QObject *parent) : QObject(parent)
{

}

void GetAppreciationData::getAppreciationData(const QString data, int data1, const QString data2, const QString data3) {
    setSendDataIndicatorRun(this->anObject);
    setWarningMessageInvisible(this->anObject);

    QDateTime dateTime;
    QString currentDateTime = dateTime.currentDateTime().toString(Qt::ISODate);
    QString appreciationID = QString::number(data1);

    QUrl url("https://appsapis.000webhostapp.com/InputDataScript/inputAppreciationData.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("studentName", "appreciation", "information", "dateTime", "schoolCode", "nuptk");
    httpRAction.httpValue(data, appreciationID, data2, currentDateTime, data3, QQmlProperty::read(this->anObject, "nuptk").toString());
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        setSendDataIndicatorStop(this->anObject);

        if(httpRAction.httpStringResponse() == "action-true") {
            qDebug() << "Succes";
        }
        else{
            setWarningMessageVisible(this->anObject);
        }
    }
    else{
        setSendDataIndicatorStop(this->anObject);
    }
}

void GetAppreciationData::setObjectOrItem(QObject *object){
    this->anObject = object;
}

void GetAppreciationData::setSendDataIndicatorRun(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("sendDataIndicatorContainer");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void GetAppreciationData::setSendDataIndicatorStop(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("sendDataIndicatorContainer");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void GetAppreciationData::setWarningMessageVisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageStudentData");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void GetAppreciationData::setWarningMessageInvisible(QObject *anItem){
    QObject *result = anItem->findChild<QObject*>("warningMessageStudentData");

    if(result) {
        result->setProperty("visible", "false");
    }
}
