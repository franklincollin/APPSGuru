#ifndef FRAGMENTVIEW_H
#define FRAGMENTVIEW_H

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
class FragmentView : public QObject
{
    Q_OBJECT
public:
    explicit FragmentView(QObject *parent = nullptr);
    FragmentView(QQmlContext *ctx, QObject *anItem);
    QObject *anObject;
    void showWarningDialog(QObject *aRoot);
    void hideWarningDialog(QObject *aRoot);
    void searchIndicatorStop(QObject *aRoot);
    void searchIconVisible(QObject *aRoot);

private:
    QQmlContext *context;
    QList <QObject*> stringList;
    QString address;

signals:

public slots:
    void studentDataListing(QString arg);
};

#endif // FRAGMENTVIEW_H
