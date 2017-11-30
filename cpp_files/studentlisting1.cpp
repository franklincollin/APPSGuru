#include "../header_files/studentlisting1.h"
#include <QObject>
#include "../header_files/httpraction.h"
#include "../header_files/dataobject.h"

StudentListing1::StudentListing1(QObject *parent) : QObject(parent)
{

}

StudentListing1::StudentListing1(QQmlContext *ctx, QObject *anItem){
    this->context = ctx;
    this->anObject = anItem;
}

void StudentListing1::receiveStudentListing(QString data, QString data1) {
    qDebug() << "Data from receiveStudentListing: " << data;

    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("http://doublef.xyz/DataAccessScript/getAppreciationData.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "school_code");
    httpRAction.httpValue(data, data1);
    httpRAction.httpExec();

    qDebug() << "HTTP Response: " << httpRAction.httpStringResponse();

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
                this->context->setContextProperty("myModel1", QVariant::fromValue(this->stringList));
            }
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        setWarningTextInternetVisible(this->anObject);
    }
}

void StudentListing1::receiveStudentDataID(QString dataID, QString data) {
    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("http://doublef.xyz/DataAccessScript/appreciationDescription.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "schoolCode", "dataID");
    httpRAction.httpValue(this->nis, data, dataID.split(" ").at(1));
    httpRAction.httpExec();

    qDebug() << "HTTP Response: " << httpRAction.httpStringResponse();

    if(!httpRAction.NetworkError) {
        QJsonParseError jsonErr;
        QJsonDocument jsonData = QJsonDocument::fromJson(httpRAction.httpRawResponse(), &jsonErr);
        QJsonObject jsonObject = jsonData.object();
        QString rawData0 = jsonObject.value("name").toString();
        QString rawData1 = jsonObject.value("date").toString();
        QString rawData2 = jsonObject.value("information").toString();
        QString rawData4 = jsonObject.value("appreciationName").toString();

        setFetchingDataIndicatorStop(this->anObject);
        setStudentDescription("deleteDataLayout1",this->anObject, rawData0, rawData1, rawData2, rawData4);
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
    }
}

void StudentListing1::deleteAppreciationData(QString arg0){
    QUrl url("http://doublef.xyz/DeleteDataScript/deleteAppreciationData.php");
    qDebug() << "This data will deleted: " << arg0;

    setFetchingDataIndicatorRun(this->anObject);

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("dataID");
    httpRAction.httpValue(arg0);
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        setFetchingDataIndicatorStop(this->anObject);

        if(httpRAction.httpStringResponse() == "success") {
            qDebug() << "Deleting data succes";
        }
        else{
            qDebug() << "Deleting data fail";
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
    }
}

void StudentListing1::setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3) {
    QObject *anRoot = someKindOfObject->findChild<QObject*>(otherRoot);
    QObject *object = anRoot->findChild<QObject*>("studentNameContainer");
    QObject *object1 = anRoot->findChild<QObject*>("dateTimeContainer");
    QObject *object2 = anRoot->findChild<QObject*>("informationContainer");
    QObject *object3 = anRoot->findChild<QObject*>("pointContainer");

    QQmlProperty::write(anRoot, "studentName1", arg0);
    QQmlProperty::write(anRoot, "dateTimeLog1", arg1);
    QQmlProperty::write(anRoot, "pointValue1", arg3);
    QQmlProperty::write(anRoot, "completeInformation1", arg2);

    if(object) {
        object->setProperty("text", arg0);
    }
    else{
        qDebug() << "Object studentNameNotFound";
    }
    if(object1) {
        object1->setProperty("text", arg1);
    }
    else{
        qDebug() << "Object studentNameNotFound";
    }
    if(object2) {
        object2->setProperty("text", arg2);
    }
    else{
        qDebug() << "Object studentNameNotFound";
    }
    if(object3){
        object3->setProperty("text", arg3);
    }
    else{
        qDebug() << "Object studentNameNotFound";
    }
}

void StudentListing1::setFetchingDataIndicatorRun(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer1");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "true");
    }
}

void StudentListing1::setFetchingDataIndicatorStop(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer1");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "false");
    }
}

void StudentListing1::setWarningTextInternetVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("internetWarningDialog1");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void StudentListing1::setEmptyDataWarningVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("emptyDataWarning1");

    if(result) {
        result->setProperty("visible", "true");
    }
}

