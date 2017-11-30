#include "../header_files/updatedata.h"
#include "../header_files/httpraction.h"
#include "../header_files/systemvariable.h"
#include "../header_files/dataobject.h"

UpdateData::UpdateData(QObject *parent) : QObject(parent)
{

}

UpdateData::UpdateData(QQmlContext *ctx, QObject *anItem){
    this->context = ctx;
    this->anObject = anItem;
}

void UpdateData::receiveStudentListing(QString data, QString data1){
    qDebug() << "Data from receiveStudentListing: " << data;

    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("http://doublef.xyz/DataAccessScript/getPunishmentData.php");

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
            stringList.clear();

            for(int i=0; i < rawDat0.count(); i++) {
                qDebug() << rawDat0.at(i).toString();
                this->stringList.append(new DataObject(rawData1.at(i).toString(), rawDat0.at(i).toString()));
                this->context->setContextProperty("myModel2", QVariant::fromValue(this->stringList));
            }
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        setWarningTextInternetVisible(this->anObject);
    }
}

void UpdateData::receiveStudentDataID(QString dataID, QString data){
    setFetchingDataIndicatorRun(this->anObject);
    qDebug() << dataID.split(" ").at(1);

    QUrl url("http://doublef.xyz/DataAccessScript/punishmentDescription.php");

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
        QString rawData3 = jsonObject.value("idPointPl").toString();
        QString rawData4 = jsonObject.value("punishmentName").toString();
        QString rawData5 = jsonObject.value("idPoint").toString();

        setFetchingDataIndicatorStop(this->anObject);

        qDebug() << "Data(receiveStudentDataID(QString dataID, QString data)): " << httpRAction.httpStringResponse();
        qDebug() << "idPoint: " << rawData3;
        setStudentDescription("updatePunishmentData", this->anObject, rawData0, rawData1, rawData2, rawData4, rawData3, rawData5);
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
    }
}

void UpdateData::updatePunishmentData(QString arg0, QString arg1, QString arg2, QString arg3, QString arg4){
    QUrl url("http://doublef.xyz/UpdateDataScript/updatePunishmentData.php");
    qDebug() << "This data will updated: " << arg2;

    setFetchingDataIndicatorRun(this->anObject);

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "school_code", "data_id", "punishment", "information");
    httpRAction.httpValue(arg0, arg1, arg2, arg3, arg4);
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        setFetchingDataIndicatorStop(this->anObject);

        if(httpRAction.httpStringResponse() == "success") {
            qDebug() << "Updating data succes";
            updateStudentDescription(this->anObject, arg3, arg4);
        }
        else{
            qDebug() << "Updating data fail";
            setWarningDialogVisible(this->anObject);
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        setWarningTextInternetVisible(this->anObject);
        qDebug()<<"Network Error";
    }
}

void UpdateData::setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3, QString arg4, QString arg5){
    QObject *object = someKindOfObject->findChild<QObject*>("studentNameContainer");
    QObject *object1 = someKindOfObject->findChild<QObject*>("dateTimeContainer");
    QObject *object2 = someKindOfObject->findChild<QObject*>("informationContainer");
    QObject *object3 = someKindOfObject->findChild<QObject*>("pointContainer");
    QObject *anotherRoot = someKindOfObject->findChild<QObject*>(otherRoot);

    QQmlProperty::write(anotherRoot, "studentName", arg0);
    QQmlProperty::write(anotherRoot, "dateTimeLog", arg1);
    QQmlProperty::write(anotherRoot, "completeInformation", arg2);
    QQmlProperty::write(anotherRoot, "pointValue", arg3);
    QQmlProperty::write(anotherRoot, "dataID", arg5);
    //QQmlProperty::write(anotherRoot, "pointValue", arg5);

    if(object) {
        object->setProperty("text", arg0);
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

void UpdateData::setFetchingDataIndicatorRun(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "true");
    }
}

void UpdateData::setFetchingDataIndicatorStop(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "false");
    }
}

void UpdateData::setWarningTextInternetVisible(QObject *anObjectOrItem){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updatePunishmentData");
    QObject *result = anRoot->findChild<QObject*>("internetWarningDialog");

    if(anRoot) {
        if(result) {
            result->setProperty("visible", "true");
        }
    }
}

void UpdateData::setEmptyDataWarningVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("emptyDataWarning");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void UpdateData::updateStudentDescription(QObject *anObjectOrItem, QString arg0, QString arg1){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updatePunishmentData");
    QObject *obj0 = anRoot->findChild<QObject*>("studentNameContainer");
    QObject *obj1 = anRoot->findChild<QObject*>("dateTimeContainer");
    QObject *obj2 = anRoot->findChild<QObject*>("pointContainer");
    QObject *obj3 = anRoot->findChild<QObject*>("informationContainer");

    if(anRoot) {
        if(obj0) {
            obj0->setProperty("text", QQmlProperty::read(anRoot, "studentName"));
        }

        if(obj1) {
            obj1->setProperty("text", QQmlProperty::read(anRoot, "dateTimeLog"));
        }

        if(obj2) {
            obj2->setProperty("text", QQmlProperty::read(anRoot, "pointValue"));
        }

        if(obj3) {
            obj3->setProperty("text", arg1);
        }
    }
}

void UpdateData::setWarningDialogVisible(QObject *anObjectOrItem){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updatePunishmentData");
    QObject *result = anRoot->findChild<QObject*>("warningDialog");

    if(anRoot) {
        if(result) {
            result->setProperty("visible", "true");
        }
    }
}
