#include <QDebug>
#include "dataobject.h"

DataObject::DataObject(QObject *parent)
    : QObject(parent)
{
}

DataObject::DataObject(const QString &name, const QString &dataID, QObject *parent)
    : QObject(parent), m_name(name), m_dataID(dataID)
{
}

DataObject::DataObject(const QString &name, const QString &dataID, const QString &picture, QObject *parent)
    : QObject(parent), m_name(name), m_dataID(dataID), m_picture(picture){
}

QString DataObject::name() const
{
    return m_name;
}

void DataObject::setName(const QString &name)
{
    if (name != m_name) {
        m_name = name;
        emit nameChanged();
    }
}

QString DataObject::dataID() const
{
    return m_dataID;
}

void DataObject::setDataID(const QString &dataID)
{
    if (dataID != m_dataID) {
        m_dataID = dataID;
        emit dataIDChanged();
    }
}

QString DataObject::picture() const{
    return m_picture;
}

void DataObject::setPicture(const QString &picture){
    if (picture != m_picture) {
        m_picture = picture;
        emit pictureChanged();
    }
}
