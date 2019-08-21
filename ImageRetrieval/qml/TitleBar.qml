import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle
{
    id: rect_titleBar;

    Image
    {
        id: image_titleBar;

        anchors.left: parent.left;
        source: "images/TitleBar/pattern.png";
    }
    Text {
        id: text_titleBar;

        anchors.left: parent.left;
        anchors.leftMargin: 45;
        height: parent.height;
        horizontalAlignment: Text.AlignLeft;
        verticalAlignment: Text.AlignVCenter;

        color: "#ffffff";
        font.family: "微软雅黑";
        font.pixelSize: 30;
        font.letterSpacing: 1;
//        font.bold: true;

        text: "图像检索";
    }

    Row
    {
        id: row_titleBarButtonList;

        anchors.right: parent.right;
        anchors.rightMargin: 30;
        anchors.verticalCenter: parent.verticalCenter;
        height: parent.height;


        spacing: 40;

        TitleButton
        {
            id: min;
            width: 50;
            height: 50;
            anchors.verticalCenter: parent.verticalCenter;
            sPressedImage: "images/TitleBar/minHover.png";
            sNormalImage: "images/TitleBar/min.png";
            sHoverImage: "images/TitleBar/minHover.png";

            state: "normal";
            nIndex: 0;
        }

        TitleButton
        {
            id: max;
            width: 50;
            height: 50;
            anchors.verticalCenter: parent.verticalCenter;
            sPressedImage: "images/TitleBar/maxHover.png";
            sNormalImage: "images/TitleBar/max.png";
            sHoverImage: "images/TitleBar/maxHover.png";

            state: "normal";
            nIndex: 1;
        }

        TitleButton
        {
            id: close;
            width: 50;
            height: 50;
            anchors.verticalCenter: parent.verticalCenter;
            sPressedImage: "images/TitleBar/closeHover.png";
            sNormalImage: "images/TitleBar/close.png";
            sHoverImage: "images/TitleBar/closeHover.png";

            state: "normal";
            nIndex: 2;

        }

    }


    MouseArea
    {
        anchors.right: parent.right;
        anchors.rightMargin: 400;

        height: parent.height;
        width: parent.width - 400;


        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        onPressed:
        {
            //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged:
        {
            //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            mainW.setX(mainW.x+delta.x)
            mainW.setY(mainW.y+delta.y)
        }

        onDoubleClicked:
        {
            mainW.visibility === Window.Windowed ?
            mainW.visibility = Window.Maximized :mainW.visibility = Window.Windowed;
        }


    }

}
