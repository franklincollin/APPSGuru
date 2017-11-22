#include "fragmenthome.h"
#include "dataobject.h"
#include "httpraction.h"

FragmentHome::FragmentHome(QObject *parent) : QObject(parent)
{

}

FragmentHome::FragmentHome(QQmlContext *ctx, QObject *anItem){
    this->context = ctx;
    this->anObject = anItem;
}

void FragmentHome::teacherActivityLogListing(){
    fetchingDataIndicatorRun(this->anObject);

    qDebug() << "Teacher Log Listing";

    QUrl url("https://appsapis.000webhostapp.com/DataAccessScript/getTeacherActivityLog.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("nuptk", "school_code");
    httpRAction.httpValue(QQmlProperty::read(this->anObject, "nuptk").toString(),
                           QQmlProperty::read(this->anObject, "schoolCodes").toString());
    httpRAction.httpExec();

    QJsonParseError jsonErr;
    QJsonDocument jsonData = QJsonDocument::fromJson(httpRAction.httpRawResponse(), &jsonErr);
    QJsonObject jsonObject = jsonData.object();
    QJsonArray rawDat0 = jsonObject.value("date_time").toArray();
    QJsonArray rawData1 = jsonObject.value("information").toArray();

    if(!httpRAction.NetworkError) {
        fetchingDataIndicatorStop(this->anObject);

        qDebug() << httpRAction.httpStringResponse();

        if(httpRAction.httpStringResponse() == "fail") {
            showWarningDialog(this->anObject);
        }

        if(!rawDat0.isEmpty()) {
            stringList.clear();

            for(int i=rawDat0.count() - 1; i >= 0; i--) {
                qDebug() << rawDat0.at(i).toString();
                this->stringList.append(new DataObject(rawData1.at(i).toString().mid(0, 30) + "..", rawDat0.at(i).toString()));
                this->context->setContextProperty("teacherLogList", QVariant::fromValue(this->stringList));
            }
        }
    }
}

void FragmentHome::fetchingDataIndicatorRun(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(object0) {
        object0->setProperty("visible", "true");
    }
}

void FragmentHome::fetchingDataIndicatorStop(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("fetchingDataIndicatorContainer");

    if(object0) {
        object0->setProperty("visible", "false");
    }
}

void FragmentHome::showWarningDialog(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("warningDialog");

    if(object0) {
        object0->setProperty("visible", "true");
    }
}

void FragmentHome::hideWarningDialog(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("warningDialog");

    if(object0) {
        object0->setProperty("visible", "false");
    }
}
