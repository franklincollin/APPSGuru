#ifndef GETPUNISHMENTDATA_H
#define GETPUNISHMENTDATA_H

#include <QObject>
#include <QDebug>
#include <QByteArray>
#include <QEventLoop>
#include <QNetworkReply>
#include <QTextCodec>
#include <QUrl>
#include <QUrlQuery>

class GetPunishmentData : public QObject
{
    Q_OBJECT
public:
    explicit GetPunishmentData(QObject *parent = nullptr);
    void setObject(QObject *anObjectOrItem);
    void setSendDataIndicatorRun(QObject *anItem);
    void setSendDataIndicatorStop(QObject *anItem);
    void setWarningMessageVisible(QObject *anItem);
    void setWarningMessageInvisible(QObject *anItem);
    void setWarningMessageInternetVisible(QObject *anItem);
    void setWarningMessageInternetInvisible(QObject *anItem);

private:
    QObject *anObject;

signals:

public slots:
    void getPunishmentStrings(const QString data, int data1, const QString data2, const QString data3);
    void setEditFragmentDefault();
};

#endif // GETPUNISHMENTDATA_H
