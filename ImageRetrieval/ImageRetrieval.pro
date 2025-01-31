QT += quick
QT += widgets
QT += core
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    myimageprovider.cpp \
    externalvar.cpp \
    imageprocess.cpp


RESOURCES += qml.qrc \
    images.qrc

/*引入opencv路径和库**************************************************************/
INCLUDEPATH +=  $$PWD/OpenCV-4.1.0-withcontrib-MinGW-x64/include\
                $$PWD/OpenCV-4.1.0-withcontrib-MinGW-x64/include\opencv2\
                $$PWD/OpenCV-4.1.0-withcontrib-MinGW-x64/include\opencv

LIBS += -L $$PWD/OpenCV-4.1.0-withcontrib-MinGW-x64/x64/mingw/lib/libopencv_*.a

/*******************************************************************************/

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    myimageprovider.h \
    externalvar.h \
    imageprocess.h
