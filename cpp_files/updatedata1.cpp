#include "../header_files/updatedata1.h"
#include "../header_files/httpraction.h"
#include "../header_files/systemvariable.h"
#include "../header_files/dataobject.h"

UpdateData1::UpdateData1(QObject *parent) : QObject(parent)
{

}

UpdateData1::UpdateData1(QQmlContext *ctx, QObject *anItem){
    this->context = ctx;
    this->anObject = anItem;
}

void UpdateData1::receiveStudentListing(QString data, QString data1){
    qDebug() << "Data from receiveStudentListing: " << data;

    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("http://doublef.xyz/DataAccessScript/getAppreciationData.php");

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
                this->context->setContextProperty("appreciationData", QVariant::fromValue(this->stringList));
            }
        }
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
        setWarningTextInternetVisible(this->anObject);
    }
}

void UpdateData1::receiveStudentDataID(QString dataID, QString data){
    setFetchingDataIndicatorRun(this->anObject);

    QUrl url("http://doublef.xyz/DataAccessScript/appreciationDescription.php");

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
        QString rawData3 = jsonObject.value("idPointPH").toString();
        QString rawData4 = jsonObject.value("appreciationName").toString();
        QString rawData5 = jsonObject.value("idPoint").toString();

        setFetchingDataIndicatorStop(this->anObject);

        qDebug() << "Data(receiveStudentDataID(QString dataID, QString data)): " << httpRAction.httpStringResponse();
        setStudentDescription("updateAppreciationData", this->anObject, rawData0, rawData1, rawData2, rawData4, rawData3, rawData5);
    }
    else{
        setFetchingDataIndicatorStop(this->anObject);
    }
}

void UpdateData1::updateAppreciationData(QString arg0, QString arg1, QString arg2, QString arg3, QString arg4){
    QUrl url("http://doublef.xyz/UpdateDataScript/updateAppreciationData.php");
    qDebug() << "This data will updated: " << arg2;

    setFetchingDataIndicatorRun(this->anObject);

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nis", "school_code", "data_id", "appreciation", "information");
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

void UpdateData1::setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3, QString arg4, QString arg5){
    QObject *object = someKindOfObject->findChild<QObject*>("studentNameContainer1");
    QObject *object1 = someKindOfObject->findChild<QObject*>("dateTimeContainer1");
    QObject *object2 = someKindOfObject->findChild<QObject*>("informationContainer1");
    QObject *object3 = someKindOfObject->findChild<QObject*>("pointContainer1");
    QObject *anotherRoot = someKindOfObject->findChild<QObject*>(otherRoot);

    QQmlProperty::write(anotherRoot, "studentName", arg0);
    QQmlProperty::write(anotherRoot, "dateTimeLog", arg1);
    QQmlProperty::write(anotherRoot, "completeInformation", arg2);
    QQmlProperty::write(anotherRoot, "pointValue", arg3);
    QQmlProperty::write(anotherRoot, "dataID", arg5);

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

void UpdateData1::setFetchingDataIndicatorRun(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer1");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "true");
    }
}

void UpdateData1::setFetchingDataIndicatorStop(QObject *anObjectOrItem){
    QObject *fetchingDataIndicator = anObjectOrItem->findChild<QObject*>("fetchingDataIndicatorContainer1");

    if(fetchingDataIndicator) {
        fetchingDataIndicator->setProperty("visible", "false");
    }
}

void UpdateData1::setWarningTextInternetVisible(QObject *anObjectOrItem){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updateAppreciationData");
    QObject *result = anRoot->findChild<QObject*>("internetWarningDialog");

    if(anRoot) {
        if(result) {
            result->setProperty("visible", "true");
        }
    }
}

void UpdateData1::setEmptyDataWarningVisible(QObject *anObjectOrItem){
    QObject *result = anObjectOrItem->findChild<QObject*>("emptyDataWarning");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void UpdateData1::updateStudentDescription(QObject *anObjectOrItem, QString arg0, QString arg1){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updateAppreciationData");
    QObject *obj0 = anRoot->findChild<QObject*>("studentNameContainer1");
    QObject *obj1 = anRoot->findChild<QObject*>("dateTimeContainer1");
    QObject *obj2 = anRoot->findChild<QObject*>("pointContainer1");
    QObject *obj3 = anRoot->findChild<QObject*>("informationContainer1");

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

void UpdateData1::setWarningDialogVisible(QObject *anObjectOrItem){
    QObject *anRoot = anObjectOrItem->findChild<QObject*>("updateAppreciationData");
    QObject *result = anRoot->findChild<QObject*>("warningDialog");

    if(anRoot) {
        if(result) {
            result->setProperty("visible", "true");
        }
    }
}

