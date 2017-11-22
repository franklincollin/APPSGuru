#ifndef FRAGMENTHOME_H
#define FRAGMENTHOME_H

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

class FragmentHome : public QObject
{
    Q_OBJECT
public:
    explicit FragmentHome(QObject *parent = nullptr);
    FragmentHome(QQmlContext *ctx, QObject *anItem);
    QObject *anObject;
    void fetchingDataIndicatorRun(QObject *aRoot);
    void fetchingDataIndicatorStop(QObject *aRoot);
    void showWarningDialog(QObject *aRoot);
    void hideWarningDialog(QObject *aRoot);

private:
    QQmlContext *context;
    QList <QObject*> stringList;
    QString address;

signals:

public slots:
    void teacherActivityLogListing();
};

#endif // FRAGMENTHOME_H
