#include "fragmentview.h"
#include "httpraction.h"
#include "dataobject.h"

FragmentView::FragmentView(QObject *parent) : QObject(parent)
{

}

FragmentView::FragmentView(QQmlContext *ctx, QObject *anItem){
    this->anObject = anItem;
    this->context = ctx;
}

void FragmentView::studentDataListing(QString arg){
    qDebug() << "Teacher Log Listing";

    QUrl url("https://appsapis.000webhostapp.com/DataAccessScript/getStudentList.php");

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("school_code", "name");
    httpRAction.httpValue(QQmlProperty::read(this->anObject, "schoolCodes").toString(),
                           arg);
    httpRAction.httpExec();

    QJsonParseError jsonErr;
    QJsonDocument jsonData = QJsonDocument::fromJson(httpRAction.httpRawResponse(), &jsonErr);
    QJsonObject jsonObject = jsonData.object();
    QJsonArray rawData0 = jsonObject.value("studentName").toArray();
    QJsonArray rawData1 = jsonObject.value("nis").toArray();
    QJsonArray rawData2 = jsonObject.value("studentPictrue").toArray();

    qDebug() << "rawData0: " << rawData0;
    qDebug() << "rawData1: " << rawData1;
    qDebug() << "rawData2: " << rawData2;

    if(!httpRAction.NetworkError) {
        searchIndicatorStop(this->anObject);
        searchIconVisible(this->anObject);

        qDebug() << httpRAction.httpStringResponse();

        if(httpRAction.httpStringResponse() == "fail") {
            showWarningDialog(this->anObject);
        }

        if(!rawData0.isEmpty()) {
            stringList.clear();

            for(int i=rawData0.count() - 1; i >= 0; i--) {
                qDebug() << rawData0.at(i).toString();
                this->stringList.append(new DataObject(rawData0.at(i).toString(), rawData1.at(i).toString(),
                                                       rawData2.at(i).toString()));
                this->context->setContextProperty("studentListModel", QVariant::fromValue(this->stringList));
            }
        }
    }
}

void FragmentView::showWarningDialog(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("warningDialog");

    if(object0) {
        object0->setProperty("visible", "true");
    }
}

void FragmentView::searchIndicatorStop(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("searchProcessIndicator");

    if(object0) {
        object0->setProperty("running", "false");
    }
}

void FragmentView::searchIconVisible(QObject *aRoot){
    QObject *anotherRoot = aRoot->findChild<QObject*>("appMain");
    QObject *object0 = anotherRoot->findChild<QObject*>("searcIcon");

    if(object0) {
        object0->setProperty("visible", "true");
    }
}
