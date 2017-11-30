#ifndef STUDENTLISTING_H
#define STUDENTLISTING_H

#include <QObject>
#include <QDebug>
#include <QQmlContext>
#include <QList>
#include <QString>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>
#include "systemvariable.h"
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlProperty>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class StudentListing : public QObject, public SystemVariable
{
    Q_OBJECT

public:
    explicit StudentListing(QObject *parent = nullptr);
    StudentListing(QQmlContext *ctx, QObject *anItem);
    QObject *anObject;
    void setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3);
    void setFetchingDataIndicatorRun(QObject *anObjectOrItem);
    void setFetchingDataIndicatorStop(QObject *anObjectOrItem);
    void setWarningTextInternetVisible(QObject *anObjectOrItem);
    void setEmptyDataWarningVisible(QObject *anObjectOrItem);

private:
    QQmlContext *context;
    QList <QObject*> stringList;
    QString address;

signals:
    void makeStudentListing(QVariant studentlist);

public slots:
    void receiveStudentListing(QString data, QString data1);
    void receiveStudentDataID(QString dataID, QString data);
    void deletePunishmentData(QString arg0);
};

#endif // STUDENTLISTING_H
