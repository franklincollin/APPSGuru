TEMPLATE = app

QT += qml quick \
    network \
    concurrent \
    core

CONFIG += c++11

SOURCES += main.cpp \
    cpp_files/dataobject.cpp \
    cpp_files/fragmenthome.cpp \
    cpp_files/fragmentview.cpp \
    cpp_files/getappreciationdata.cpp \
    cpp_files/getpunishmentdata.cpp \
    cpp_files/httplogin.cpp \
    cpp_files/httplogout.cpp \
    cpp_files/httpraction.cpp \
    cpp_files/profiledetail.cpp \
    cpp_files/studentlisting.cpp \
    cpp_files/studentlisting1.cpp \
    cpp_files/updatedata.cpp \
    cpp_files/updatedata1.cpp

RESOURCES += qml.qrc \
    icons.qrc \
    js.qrc \
    icons-24px.qrc \
    icons-32px.qrc \
    icons-64px.qrc \
    icons-128px.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    header_files/dataobject.h \
    header_files/fragmenthome.h \
    header_files/fragmentview.h \
    header_files/getappreciationdata.h \
    header_files/getpunishmentdata.h \
    header_files/httplogin.h \
    header_files/httplogout.h \
    header_files/httpraction.h \
    header_files/profiledetail.h \
    header_files/studentlisting.h \
    header_files/studentlisting1.h \
    header_files/systemvariable.h \
    header_files/updatedata.h \
    header_files/updatedata1.h
