#ifndef HTTPLOGOUT_H
#define HTTPLOGOUT_H

#include <QObject>
#include <QDebug>
#include <QQmlContext>
#include <QString>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlProperty>
#include "httpraction.h"

class HTTPLogout : public QObject
{
    Q_OBJECT
public:
    HTTPLogout(QObject *anObjectOrItem);
    //HTTPLogout(QObject *anObjectOrItem);

private:
    QObject *anObject;

signals:
    void changeToLoginLayout();

public slots:
    void logoutProcess(QString username);
};

#endif // HTTPLOGOUT_H
