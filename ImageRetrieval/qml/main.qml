import QtQuick 2.6
import QtQuick.Window 2.2

Window {

    id: mainW

    visible: true
//    width: Screen.desktopAvailableWidth * 2/3;
//    height: Screen.desktopAvailableHeight * 2/3;

    width: 1600;
    height: 900;

//    width: 1920;
//    height: 1080;

    minimumWidth: 640;
    minimumHeight: 360;

    property int leftMarg: 15;
    property int leftAreaWidth: mainW.width * 0.382;

    title: qsTr("Image Retrieval")

    flags: Qt.CursorShape |  Qt.WindowSystemMenuHint  |  Qt.WindowMinimizeButtonHint | Qt.Window;
//|Qt.FramelessWindowHint

    TitleBar
    {
        id: titleBar_mainWin;

        anchors.top: parent.top;

        width: parent.width;
        height: 88;

        color: "#1c0f4e";
    }

    MyMenuBar
    {
        id: menuBar_mainWin;

        anchors.top: parent.top;
        anchors.topMargin: 88;

        width: parent.width;
        height: 62;

        color: "#352e57";
    }

    Row
    {
        id: mainArea;
        anchors.top: parent.top;
        anchors.topMargin: 150;

        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 56;

        anchors.horizontalCenter: parent.horizontalCenter;

        width: parent.width - leftMarg*2 -4;
        height: parent.height - 204;

        spacing: 2;

        LeftArea
        {
            id: leftarea_mainWin;

            width: leftAreaWidth;
            height: parent.height;

            border.width: 2;
            border.color: "#f18e31";

        }

        RightArea
        {
            id: rightarea_mainWin;

            width: parent.width - leftAreaWidth;
            height: parent.height;

            border.width: 2;
            border.color: "#f18e31";
        }


    }

    PaintPanel
    {
        id:paintPanel_mainWin;
        visible: false;
    }


    StatusBar
    {
        id: statusBar_mainWin;

//        anchors.left: parent.left;
//        anchors.leftMargin: 15;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        anchors.horizontalCenter: parent.horizontalCenter;

        width: parent.width - leftMarg*2 -2;
        height: 50;

        color: "transparent";

        border.width: 2;
        border.color: "#f18e31";
    }

    Rectangle
    {
        z: -1;
        anchors.fill: parent;
        color: "#352e57";
    }

    MouseArea
    {
        z:-0.9;
        id: dragCenterArea;
        acceptedButtons: Qt.LeftButton;
        hoverEnabled: true;
        anchors.fill: parent;

        property int resizing: 0

        function getMousePosition(mouseX, mouseY)
        {
            if(mouseY > 150 && mouseY < mainW.height - 56
                    && mouseX > (leftMarg+leftAreaWidth-2)
                    && mouseX < (leftMarg+leftAreaWidth+6))
            {
                return 1;
            }else{return 0;}
        }

        function getCursorShape(mouseX, mouseY)
        {
            if(getMousePosition(mouseX, mouseY))
            {
                return Qt.SizeHorCursor;
            }else
            {
                return Qt.ArrowCursor;
            }
        }

        function resizeWin(mouseX, mouseY)
        {
            leftAreaWidth = mouseX - leftMarg;
            if(leftAreaWidth < 400)
                leftAreaWidth = 400;
            if(leftAreaWidth > 1000)
                leftAreaWidth = 1000;
        }
        onPositionChanged:
        {
            if (resizing == 0)
            {
                cursorShape = getCursorShape(mouse.x, mouse.y);
            }else
            {
                resizeWin(mouse.x, mouse.y)
            }
        }
        onPressed:
        {
            resizing = getMousePosition(mouseX, mouseY);
        }
        onReleased:
        {
            resizing = 0;
        }

    }


}
