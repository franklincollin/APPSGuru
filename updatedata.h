#ifndef UPDATEDATA_H
#define UPDATEDATA_H

#include "systemvariable.h"
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
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlProperty>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class UpdateData : public QObject, public SystemVariable
{
    Q_OBJECT

public:
    explicit UpdateData(QObject *parent = nullptr);
    UpdateData(QQmlContext *ctx, QObject *anItem);
    QObject *anObject;
    void setStudentDescription(QString otherRoot, QObject *someKindOfObject, QString arg0, QString arg1, QString arg2, QString arg3, QString arg4, QString arg5);
    void setFetchingDataIndicatorRun(QObject *anObjectOrItem);
    void setFetchingDataIndicatorStop(QObject *anObjectOrItem);
    void setWarningTextInternetVisible(QObject *anObjectOrItem);
    void setEmptyDataWarningVisible(QObject *anObjectOrItem);
    void updateStudentDescription(QObject *anObjectOrItem, QString arg0, QString arg1);
    void setWarningDialogVisible(QObject *anObjectOrItem);

private:
    QQmlContext *context;
    QList <QObject*> stringList;
    QString address;

signals:
    void nameChanged();
    void dataIdChanged();

public slots:
    void receiveStudentListing(QString data, QString data1);
    void receiveStudentDataID(QString dataID, QString data);
    void updatePunishmentData(QString arg0, QString arg1, QString arg2, QString arg3, QString arg4);
};

#endif // UPDATEDATA_H
