#ifndef HTTPRACTION_H
#define HTTPRACTION_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>


class HTTPRAction : public QObject
{
    Q_OBJECT
public:
    explicit HTTPRAction(QObject *parent = nullptr);

    //Set URL
    void httpUrl(QUrl url);

    //Set HTTP parameter(s)
    void httpParam(QString param);
    void httpParam(QString param0, QString param1);
    void httpParam(QString param0, QString param1, QString param2);
    void httpParam(QString param0, QString param1, QString param2, QString param3);
    void httpParam(QString param0, QString param1, QString param2, QString param3, QString param4);
    void httpParam(QString param0, QString param1, QString param2, QString param3, QString param4, QString param5);

    //Set HTTP parameter(s) value(s)
    void httpValue(QString value);
    void httpValue(QString value0, QString value1);
    void httpValue(QString value0, QString value1, QString value2);
    void httpValue(QString value0, QString value1, QString value2, QString value3);
    void httpValue(QString value0, QString value1, QString value2, QString value3, QString value4);
    void httpValue(QString value0, QString value1, QString value2, QString value3, QString value4, QString value5);

    //Execute the fucking HTTP Request!
    void httpExec();

    //Return the HTTP response(QString type)
    QString httpStringResponse();
    //Return the HTTP Response(QByteArray type)
    QByteArray httpRawResponse();

    //Network error indicator
    bool NetworkError;

private:
    QUrl urlForUse;

    //Params name
    QString params;
    QString params0;
    QString params1;
    QString params2;
    QString params3;
    QString params4;
    QString params5;

    //Params value
    QString values;
    QString values0;
    QString values1;
    QString values2;
    QString values3;
    QString values4;
    QString values5;

    //HTTP response result
    QString httpResult;
    QByteArray httpVariantResponse;

signals:

public slots:
};

#endif // HTTPRACTION_H
