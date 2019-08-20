import QtQuick 2.6
import QtQuick.Window 2.2

Window {

    id: mainW

    visible: true
//    width: Screen.desktopAvailableWidth * 2/3;
//    height: Screen.desktopAvailableHeight * 2/3;

    width: 1920;
    height: 1080;

    minimumWidth: 640;
    minimumHeight: 360;

    title: qsTr("Image Retrieval")

//    flags: Qt.CursorShape |  Qt.WindowSystemMenuHint |Qt.FramelessWindowHint |  Qt.WindowMinimizeButtonHint | Qt.Window;


    TitleBar
    {
        id: titleBar_mainWin;

        anchors.top: parent.top;

        width: parent.width;
        height: 88;

        color: "#1c0f4e"
    }

    MyMenuBar
    {
        id: menuBar_mainWin;

        anchors.top: parent.top;
        anchors.topMargin: 88;

        width: parent.width;
        height: 65;

        color: "#352e57"
    }








}
