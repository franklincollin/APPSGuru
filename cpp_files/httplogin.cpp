#include "httplogin.h"
#include <QQmlProperty>

HTTPLogin::HTTPLogin(QObject *parent) : QObject(parent)
{

}

void HTTPLogin::getLoginData(const QString param, const QString param1){
    qDebug() << "Data from getLoginData(): " << param << param1;
    QUrl url("https://appsapis.000webhostapp.com/LoginScript/superUserLogin.php");

    setBusyIndicatorRun(this->anItem);
    setWarningTexInvisible(this->anItem);
    setWarningTextInternetInvisible(this->anItem);

    HTTPRAction httpRAction;
    httpRAction.httpUrl(url);
    httpRAction.httpParam("username", "password");
    httpRAction.httpValue(param, param1);
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        setBusyIndicatorStop(this->anItem);

        qDebug() << "Success";
        qDebug() << "HTTP Response: " << httpRAction.httpStringResponse();

        QStringList testArray = httpRAction.httpStringResponse().split(",");

        if(testArray[0] == "login true") {
            emit sendHTTPResponse(httpRAction.httpStringResponse(), testArray[1], testArray[2],
                    testArray[3], testArray[4], testArray[5], testArray[6]);
        }
        else {
            setBusyIndicatorStop(this->anItem);
            setWarningTexVisible(this->anItem);
        }
    }
    else {
        setBusyIndicatorStop(this->anItem);
        setWarningTextInternetVisible(this->anItem);

        qDebug() << "Fail";
    }
}

void HTTPLogin::setObject(QObject *anObject){
    this->anItem = anObject;
}

void HTTPLogin::setBusyIndicatorRun(QObject *anItemOrObject){
    QObject *result = anItemOrObject->findChild<QObject*>("loginIndicatorContainer");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void HTTPLogin::setBusyIndicatorStop(QObject *anItemOrObject) {
    QObject *result = anItemOrObject->findChild<QObject*>("loginIndicatorContainer");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void HTTPLogin::setWarningTextInternetVisible(QObject *anItemOrObject){
    QObject *result = anItemOrObject->findChild<QObject*>("warningText1");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void HTTPLogin::setWarningTextInternetInvisible(QObject *anItemOrObject){
    QObject *result = anItemOrObject->findChild<QObject*>("warningText1");

    if(result) {
        result->setProperty("visible", "false");
    }
}

void HTTPLogin::setWarningTexVisible(QObject *anItemOrObject){
    QObject *result = anItemOrObject->findChild<QObject*>("warningText");

    if(result) {
        result->setProperty("visible", "true");
    }
}

void HTTPLogin::setWarningTexInvisible(QObject *anItemOrObject){
    QObject *result = anItemOrObject->findChild<QObject*>("warningText");

    if(result) {
        result->setProperty("visible", "false");
    }
}
