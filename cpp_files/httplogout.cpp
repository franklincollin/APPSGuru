#include "../header_files/httplogout.h"

HTTPLogout::HTTPLogout(QObject *anObjectOrItem){
    this->anObject = anObjectOrItem;
}

void HTTPLogout::logoutProcess(QString username){
    qDebug() << "Destroy Session for: " << username;
    QObject *internetWarning = this->anObject->findChild<QObject*>("warningDialog");
    QObject *fetchingDataIndicator = this->anObject->findChild<QObject*>("fetchingDataIndicator");

    HTTPRAction httpRAction;
    QUrl url("http://doublef.xyz/LoginScript/logout.php");
    httpRAction.httpUrl(url);
    httpRAction.httpParam("username");
    httpRAction.httpValue(username);
    httpRAction.httpExec();

    if(!httpRAction.NetworkError) {
        if(httpRAction.httpStringResponse() == "log-out-true") {
            qDebug() << username << " is log out";

            fetchingDataIndicator->setProperty("visible", "false");
            changeToLoginLayout();
        }
        else{
            qDebug() << "Something when wrong";
            fetchingDataIndicator->setProperty("visible", "false");
            internetWarning->setProperty("visible", "true");
        }
    }

    else{
        fetchingDataIndicator->setProperty("visible", "false");
        internetWarning->setProperty("visible", "true");
    }
}
