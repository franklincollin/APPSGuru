#ifndef STUDENTLISTING1_H
#define STUDENTLISTING1_H

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

class StudentListing1 : public QObject, public SystemVariable
{
    Q_OBJECT
public:
    explicit StudentListing1(QObject *parent = nullptr);
    StudentListing1(QQmlContext *ctx, QObject *anItem);
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
    void makeStudentListing1(QVariant studentlist);

public slots:
    void receiveStudentListing(QString data, QString data1);
    void receiveStudentDataID(QString dataID, QString data);
    void deleteAppreciationData(QString arg0);
};

#endif // STUDENTLISTING1_H
