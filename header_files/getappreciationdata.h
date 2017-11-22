#ifndef GETAPPRECIATIONDATA_H
#define GETAPPRECIATIONDATA_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>

class GetAppreciationData : public QObject
{
    Q_OBJECT
public:
    explicit GetAppreciationData(QObject *parent = nullptr);
    QString studentName();
    void setObjectOrItem(QObject *object);
    void setSendDataIndicatorRun(QObject *anItem);
    void setSendDataIndicatorStop(QObject *anItem);
    void setWarningMessageVisible(QObject *anItem);
    void setWarningMessageInvisible(QObject *anItem);

private:
    QObject *anObject;

signals:

public slots:
    void getAppreciationData(const QString data, int data1, const QString data2, const QString data3);
};

#endif // GETAPPRECIATIONDATA_H
