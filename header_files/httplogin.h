#ifndef HTTPLOGIN_H
#define HTTPLOGIN_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>
#include "systemvariable.h"
#include "httpraction.h"

class HTTPLogin : public QObject, public SystemVariable
{
    Q_OBJECT
public:
    explicit HTTPLogin(QObject *parent = nullptr);
    void setObject(QObject *anObject);
    void setBusyIndicatorRun(QObject *anItemOrObject);
    void setBusyIndicatorStop(QObject *anItemOrObject);
    void setWarningTextInternetVisible(QObject *anItemOrObject);
    void setWarningTextInternetInvisible(QObject *anItemOrObject);
    void setWarningTexVisible(QObject *anItemOrObject);
    void setWarningTexInvisible(QObject *anItemOrObject);

private:
    QObject *anItem;

signals:
    void sendHTTPResponse(QVariant httpResponse, QVariant schoolCode, QVariant teacherNUPTK,
                          QVariant teacherName, QVariant teacherBirthDay, QVariant motivationText, QVariant teacherProfile,
                          QVariant username);

public slots:
    void getLoginData(const QString param, const QString param1);
};

#endif // HTTPLOGIN_H
