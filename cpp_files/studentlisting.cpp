#include "studentlisting.h"
#include "systemvariable.h"
#include "httpraction.h"
#include <QObject>
#include "dataobject.h"

StudentListing::StudentListing(QObject *parent) : QObject(parent)
{

}

StudentListing::StudentListing(QQmlContext *ctx, QObject *anItem){
    this->context = ctx;
    this->anObject = anItem;
}

void StudentListing::receiveStudentListing(QString data, QString data1){
    qDebug() << "Data from receiveStudentListing: " << data;

    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("https://appsapis.000webhostapp.com/DataAccessScript/getPunishmentData.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "school_code");
    httpRAction.httpValue(data, data1);
    httpRAction.httpExec();

    QJsonParseError jsonErr;
    QJsonDocument jsonData = QJsonDocument::fromJson(httpRAction.httpRawResponse(), &jsonErr);
    QJsonObject jsonObject = jsonData.object();
    QJsonArray rawDat0 = jsonObject.value("dataID").toArray();
    QJsonArray rawData1 = jsonObject.value("date").toArray();

    if(!httpRAction.NetworkError) {
        setFetchingDataIndicatorStop(this->anObject);

        if(httpRAction.httpStringResponse() == "fail") {
            setFetchingDataIndicatorStop(this->anObject);
            setEmptyDataWarningVisible(this->anObject);
        }
        else if(!rawDat0.isEmpty()) {
            this->nis = data;
            this->stringList.clear();

            for(int i=0; i < rawDat0.count(); i++) {
                qDebug() << rawDat0.at(i).toString();
                this->stringList.append(new DataObject(rawData1.at(i).toString(), rawDat0.at(i).toString()));
                this->context->setContextProperty("myModel", QVariant::fromValue(this->stringList));
            }
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        setWarningTextInternetVisible(this->anObject);
    }
}

void StudentListing::receiveStudentDataID(QString dataID, QString data) {
    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("https://appsapis.000webhostapp.com/DataAccessScript/punishmentDescription.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "schoolCode", "dataID");
    httpRAction.httpValue(this->nis, data, dataID.split(" ").at(1));
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        QJsonParseError jsonErr;
        QJsonDocument jsonData = QJsonDocument::fromJson(httpRAction.httpRawResponse(), &jsonErr);
        QJsonObject jsonObject = jsonData.object();
        QString rawData0 = jsonObject.value("name").toString();
        QString rawData1 = jsonObject.value("date").toString();
        QString rawData2 = jsonObject.value("information").toString();
        QString rawData4 = jsonObject.value("punishmentName").toString();

        setFetchingDataIndicatorStop(this->anObject);
        setStudentDescription("deleteDataLayout",this->anObject, rawData0, rawData1, rawData2, rawData4);
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
    }
}

void StudentListing::deletePunishmentData(QString arg0){
    QUrl url("https://appsapis.000webhostapp.com/DeleteDataScript/deletePunishmentData.php");
    qDebug() << "This data will deleted: " << arg0;

    setFetchingDataIndicatorRun(this->anObject);

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("dataID");
    httpRAction.httpValue(arg0);
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        setFetchingDataIndicatorStop(this->anObject);
        qDebug() << httpRAction.httpStringResponse();

        if(httpRAction.httpStringResponse() == "success") {
            qDebug() << "Deleting data succes";
        }
        else{
            qDebug() << "Deleting data fail";
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        qDebug()<<"Network Error";
    }
}

void StudentListing::setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3) {
    QObject *anRoot = someKindOfObject->findChild<QObject*>(otherRoot);
    QObject *object = someKindOfObject->findChild<QObject*>("studentNameContainer");
    QObject *object1 = someKindOfObject->findChild<QObject*>("dateTimeContainer");
    QObject *object2 = someKindOfObject->findChild<QObject*>("informationContainer");
    QObject *object3 = someKindOfObject->findChild<QObject*>("pointContainer");

    QQmlProperty::write(anRoot, "studentName", arg0);
    QQmlProperty::write(anRoot, "dateTimeLog", arg1);
    QQmlProperty::write(anRoot, "pointValue", arg3);
    QQmlProperty::write(anRoot, "completeInformation", arg2);

    if(object) {
        object->setProperty("text", arg0);
    }
    else{
        qDebug() << "Object studentNameNotFound";
    }
    if(object1) {
        object1->setProperty("text", arg1);
    }
    if(object2) {
        object2->setProperty("text", arg2);
    }
    if(object3){
        object3->setProperty("text", arg3);
    }
}

void StudentListing::setFetchingDataIndicatorRun(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "true");
    }
}

void StudentListing::setFetchingDataIndicatorStop(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "false");
    }
}

void StudentListing::setWarningTextInternetVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("internetWarningDialog");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void StudentListing::setEmptyDataWarningVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("emptyDataWarning");

    if(result) {
        result->setProperty("visible", "true");
    }
}
