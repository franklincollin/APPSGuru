#include "../header_files/profiledetail.h"
#include <QDebug>

ProfileDetail::ProfileDetail(QObject *parent) : QObject(parent)
{

}

void ProfileDetail::setObjectOrItem(QObject *objectOrItem){
    this->anObject = objectOrItem;
}

void ProfileDetail::setProfileData(QObject *item){
    qDebug() << "Nama Guru: " << QQmlProperty::read(item, "teacherCompleteName").toString();

    QObject *result = item->findChild<QObject*>("name");
    QObject *result1 = item->findChild<QObject*>("birthDay");
    QObject *result2 = item->findChild<QObject*>("nuptk");
    QObject *result3 = item->findChild<QObject*>("motivationText");
    QObject *result4 = item->findChild<QObject*>("profilePicture");

    if(result) {
        result->setProperty("text", QQmlProperty::read(item, "teacherCompleteName").toString());
    }

    if(result1) {
        result1->setProperty("text", QQmlProperty::read(item, "teacherBirth").toString());
    }

    if(result2) {
        result2->setProperty("text", QQmlProperty::read(item, "nuptk").toString());
    }

    if(result3) {
        result3->setProperty("text", QQmlProperty::read(item, "motivation").toString());
    }

    if(result4) {
        result4->setProperty("source", "http://doublef.xyz/teacherPhotoProfile/" + QQmlProperty::read(item, "teacherProfilePicture").toString());
    }
}

void ProfileDetail::setProfileDetail(){
    setProfileData(this->anObject);
}
