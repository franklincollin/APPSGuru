#ifndef PROFILEDETAIL_H
#define PROFILEDETAIL_H

#include <QObject>
#include <QQmlProperty>

class ProfileDetail : public QObject
{
    Q_OBJECT
public:
    explicit ProfileDetail(QObject *parent = nullptr);
    void setObjectOrItem(QObject *objectOrItem);
    void setProfileData(QObject *item);

private:
    QObject *anObject;

signals:

public slots:
    void setProfileDetail();
};

#endif // PROFILEDETAIL_H
