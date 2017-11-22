#ifndef DATAOBJECT_H
#define DATAOBJECT_H

#include <QObject>

//![0]
class DataObject : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString dataID READ dataID WRITE setDataID NOTIFY dataIDChanged)
    Q_PROPERTY(QString picture READ picture WRITE setPicture NOTIFY pictureChanged)
//![0]

public:
    DataObject(QObject *parent=0);
    DataObject(const QString &name, const QString &dataID, QObject *parent=0);
    DataObject(const QString &name, const QString &dataID, const QString &picture, QObject *parent=0);

    QString name() const;
    void setName(const QString &name);

    QString dataID() const;
    void setDataID(const QString &dataID);

    QString picture() const;
    void setPicture(const QString &picture);

signals:
    void nameChanged();
    void dataIDChanged();
    void pictureChanged();

private:
    QString m_name;
    QString m_dataID;
    QString m_picture;
//![1]
};
//![1]

#endif // DATAOBJECT_H
