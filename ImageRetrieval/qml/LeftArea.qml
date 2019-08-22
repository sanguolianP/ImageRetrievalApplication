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
        anchors.rightMargin: 90;
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
        width: (mainW.leftAreaWidth-200) > 300 ? (mainW.leftAreaWidth-200) : 300;
        height: (imageArea.width *3/4) < 450 ? (imageArea.width *3/4) : 450;
//        height:400;

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

    Column
    {
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 100;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 300;
        height: 200;

        spacing: 10;

        Row
        {
            id: row_colorSlider;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 300;
            height: 50;

            spacing: 22;
            Text
            {
                id: textcolor;
                anchors.verticalCenter: parent.verticalCenter;
                width: 60;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "颜色：";
            }
            Slider
            {
                id: colorSlider;
                width: 200;
                height: 50;
                minimumValue: 0
                maximumValue: 9;
                stepSize: 1;
                value: 6;
                onValueChanged:
                {
                    valuecolor.text =  "0." + value;
                }
                style: SliderStyle
                {
                    groove:Rectangle
                    {
                        width: colorSlider.width;
                        height: 2;
                        Image
                        {
                            width: parent.width - 6;
                            height: parent.height;
                            anchors.fill: parent;
                            source: "images/MainInterface/left/slider.png";
                        }
                    }
                    handle:Rectangle
                    {
                        width: 30;
                        height: 30;
                        color: "transparent";
                        Image
                        {
                            anchors.fill: parent;
                            source: "images/MainInterface/left/sliderDrag.png";
                        }
                    }
                }
            }
            Text
            {
                id: valuecolor;
                anchors.verticalCenter: parent.verticalCenter;
                width: 30;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "0.6";
            }
        }

        Row
        {
            id: row_textureSlider;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 300;
            height: 50;

            spacing: 22;
            Text
            {
                id: textTexture;
                anchors.verticalCenter: parent.verticalCenter;
                width: 60;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "纹理：";
            }
            Slider
            {
                id: textureSlider;
                width: 200;
                height: 50;
                minimumValue: 0
                maximumValue: 9;
                stepSize: 1;
                value: 3;
                onValueChanged:
                {
                    valuetexture.text =  "0." + value;
                }
                style: SliderStyle
                {
                    groove:Rectangle
                    {
                        width: textureSlider.width;
                        height: 2;
                        Image
                        {
                            width: parent.width - 6;
                            height: parent.height;
                            anchors.fill: parent;
                            source: "images/MainInterface/left/slider.png";
                        }
                    }
                    handle:Rectangle
                    {
                        width: 30;
                        height: 30;
                        color: "transparent";
                        Image
                        {
                            anchors.fill: parent;
                            source: "images/MainInterface/left/sliderDrag.png";
                        }
                    }
                }
            }
            Text
            {
                id: valuetexture;
                anchors.verticalCenter: parent.verticalCenter;
                width: 30;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "0.3";
            }
        }

        Row
        {
            id: row_shapeSlider;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 300;
            height: 50;

            spacing: 22;
            Text
            {
                id: textShape;
                anchors.verticalCenter: parent.verticalCenter;
                width: 60;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "形状：";
            }
            Slider
            {
                id: shapeSlider;
                width: 200;
                height: 50;
                minimumValue: 0
                maximumValue: 9;
                stepSize: 1;
                value: 1;
                onValueChanged:
                {
                    valueshape.text =  "0." + value;
                }
                style: SliderStyle
                {
                    groove:Rectangle
                    {
                        width: shapeSlider.width;
                        height: 2;
                        Image
                        {
                            width: parent.width - 6;
                            height: parent.height;
                            anchors.fill: parent;
                            source: "images/MainInterface/left/slider.png";
                        }
                    }
                    handle:Rectangle
                    {
                        width: 30;
                        height: 30;
                        color: "transparent";
                        Image
                        {
                            anchors.fill: parent;
                            source: "images/MainInterface/left/sliderDrag.png";
                        }
                    }
                }
            }
            Text
            {
                id: valueshape;
                anchors.verticalCenter: parent.verticalCenter;
                width: 30;
                color: "#ffffff";
                font.family: "微软雅黑";
                font.pixelSize: 22;
                font.letterSpacing: 1;
                text: "0.1";
            }
        }

        RetrievalButton
        {
            id:retrievalButton_LeftArea;
            width: 256;
            height: 56;
            anchors.horizontalCenter: parent.horizontalCenter;
            nTextSize: 24;
            sTextText: "检索"
            sPressedImage: "images/MainInterface/left/retrievalOn.png";
            sNormalImage: "images/MainInterface/left/retrieval.png";
            sHoverImage: "images/MainInterface/left/retrievalOn.png";
            state: "normal";
            nIndex: 0;
            onRetrievalButtonIndexBack:
            {
                console.log(nIndex);
            }
        }

    }



}
