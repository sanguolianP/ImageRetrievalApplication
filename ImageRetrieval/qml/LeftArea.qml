import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {

    id: rect_leftArea;

    color: "#413d5b";
//    property int sliderValue:

    Row
    {
        id: lefttoolbuttonList;

        anchors.right: parent.right;
        anchors.rightMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 40;

        width: 41 * 5;
        height: 35;

        spacing: 8;

        LeftToolButton
        {
            id: paintButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;

            sPressedImage: "images/MainInterface/left/paint.png";
            sNormalImage: "images/MainInterface/left/paint.png";
            sHoverImage: "images/MainInterface/left/paint.png";

            state: "normal";
            nIndex: 0;
        }
        LeftToolButton
        {
            id: zoomInButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;

            sPressedImage: "images/MainInterface/left/zoomIn.png";
            sNormalImage: "images/MainInterface/left/zoomIn.png";
            sHoverImage: "images/MainInterface/left/zoomIn.png";

            state: "normal";
            nIndex: 1;
        }
        LeftToolButton
        {
            id: zoomOutButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;

            sPressedImage: "images/MainInterface/left/zoomOut.png";
            sNormalImage: "images/MainInterface/left/zoomOut.png";
            sHoverImage: "images/MainInterface/left/zoomOut.png";

            state: "normal";
            nIndex: 2;
        }
        LeftToolButton
        {
            id: rotateButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;

            sPressedImage: "images/MainInterface/left/rotate.png";
            sNormalImage: "images/MainInterface/left/rotate.png";
            sHoverImage: "images/MainInterface/left/rotate.png";

            state: "normal";
            nIndex: 3;
        }
        LeftToolButton
        {
            id: rectButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;

            sPressedImage: "images/MainInterface/left/rectChoose.png";
            sNormalImage: "images/MainInterface/left/rectChoose.png";
            sHoverImage: "images/MainInterface/left/rectChoose.png";

            state: "normal";
            nIndex: 4;
        }
    }


    Rectangle
    {
        id:imageArea;
        width: 350;
        height: 328;

        anchors.top: parent.top;
        anchors.topMargin: 100;
        anchors.horizontalCenter: parent.horizontalCenter;
        color: "#aaaaaa";

        Image {
            id: imageMain;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            source: "images/MainInterface/left/image.png";
        }
    }

        Row
        {
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 50;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 300;
            height: 50;

            spacing: 10;
            Text
            {
                id: textcolor;
                anchors.verticalCenter: parent.verticalCenter;
                width: 90;
                text: qsTr("颜色：0.1");
            }
            Slider
            {
                width: 200;
                height: 50;
                minimumValue: 0
                maximumValue: 9;
                stepSize: 1;
                value: 5;
                onValueChanged:
                {
                    textcolor.text = "颜色：" + "0." + value;
                }
                style: SliderStyle
                {
                    handle:Rectangle
                    {
                        anchors.fill:parent;
                        Image
                        {
                            anchors.fill: parent;
                            source: "images/MainInterface/left/slider.png";
                        }
                    }
                }
            }
        }



}
