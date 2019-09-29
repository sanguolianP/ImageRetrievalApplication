import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import Imagepro 1.1

Rectangle {

    id: rect_leftArea;

    color: "#413d5b";
//    property int sliderValue:
    property int mainImageWidth:120;
    property int mainImageHeight:100;
    // 定义缩放比例系数变量,范围在(-10,10)之间
    property double scaleValue: 1.1;
    property int scaleLevel: 0;
    property int rotationAngle: 0;

    function zoomIn(x,y){
        var beforeWidth  = imageMain.width;
        var beforeHeight = imageMain.height;
        imageMain.width = imageMain.width   * scaleValue;
        imageMain.height = imageMain.height * scaleValue;
        showImgMouseArea.width = imageMain.width;
        showImgMouseArea.height = imageMain.height;

        imageMain.x = imageMain.x + x - imageMain.width  * x / beforeWidth;
        imageMain.y = imageMain.y + y - imageMain.height * y / beforeHeight;
        scaleLevel++;
    }

    function zoomOut(x,y){
        var beforeWidth  = imageMain.width;
        var beforeHeight = imageMain.height;
        imageMain.width = imageMain.width   / scaleValue;
        imageMain.height = imageMain.height / scaleValue;
        showImgMouseArea.width = imageMain.width;
        showImgMouseArea.height = imageMain.height;
        imageMain.x = imageMain.x + x - imageMain.width  * x / beforeWidth;
        imageMain.y = imageMain.y + y - imageMain.height * y / beforeHeight;
        scaleLevel--;
    }

    ImageProItem
    {
        id: imageItem;
    }
    Image {
        id: vleftarrow;
        source: "images/MainInterface/right/leftDrag";
        width: 8;
        height:10;

        anchors.right: parent.right;
        anchors.rightMargin: 3;
        anchors.verticalCenter: parent.verticalCenter;

    }

    Row
    {
        id: lefttoolbuttonList;
        z: 0.4;
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
            sButtoncolor: "#352e57";

            sPressedImage: "images/MainInterface/left/paint.png";
            sNormalImage: "images/MainInterface/left/paint.png";
            sHoverImage: "images/MainInterface/left/paint.png";

            state: "normal";
            nIndex: 0;
            onBack:
            {
                paintPanel_mainWin.visible = true;
            }
        }
        LeftToolButton
        {
            id: zoomInButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;
            sButtoncolor: "#352e57";
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
            sButtoncolor: "#352e57";

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
            sButtoncolor: "#352e57";

            sPressedImage: "images/MainInterface/left/rotate.png";
            sNormalImage: "images/MainInterface/left/rotate.png";
            sHoverImage: "images/MainInterface/left/rotate.png";

            state: "normal";
            nIndex: 3;

            onBack:
            {
                console.log("1111111111111");
                rotationAnimation.start();
                rotationAngle += 90;
                console.log(rotationAngle);
            }

        }
        LeftToolButton
        {
            id: rectButton;
            width: 33;
            height: 33;
            anchors.verticalCenter: parent.verticalCenter;
            sButtoncolor: "#352e57";

            sPressedImage: "images/MainInterface/left/rectChoose.png";
            sNormalImage: "images/MainInterface/left/rectChoose.png";
            sHoverImage: "images/MainInterface/left/rectChoose.png";

            state: "normal";
            nIndex: 4;
            onBack:
            {
                chooserectr_mainWin.visible = true;
            }
        }
    }


    Rectangle
    {
        id:imageArea;
        z: 0.1;
        width: (mainW.leftAreaWidth-200) > 300 ? (mainW.leftAreaWidth-200) : 300;
        height: (imageArea.width *3/4) < 450 ? (imageArea.width *3/4) : 450;
//        height:400;

        anchors.top: parent.top;
        anchors.topMargin: 100;
        anchors.horizontalCenter: parent.horizontalCenter;
        color: "#aaaaaa";
//        color: "transparent";
        clip: true;

        Image
        {
            id: imageMain;
            z: 0.2;

            rotation: rotationAngle;

            asynchronous: true;

            fillMode: Image.PreserveAspectFit;

            width: imageArea.width;
            height: imageArea.width * mainImageHeight/mainImageWidth;

            cache: false;

            source: "image://imgProvider/hello";

            MouseArea
            {
                id: showImgMouseArea;
                anchors.fill: imageMain;
                //设置鼠标悬停以及鼠标响应
                hoverEnabled: true;

                //设置拖拽对象以及拖拽区域
                drag.target: imageMain;
                drag.axis: "XAndYAxis";
                drag.minimumX: - imageMain.width + 50;
                drag.minimumY: - imageMain.height + 50;
                drag.maximumX: imageArea.width - 50;
                drag.maximumY: imageArea.height - 50;

                // 鼠标滚轮处理函数
                onWheel:
                {
                    if(wheel.angleDelta.y>0 && scaleLevel<=10){//图像放大处理
                        imageMain.transformOriginPoint.x = wheel.x;
                        imageMain.transformOriginPoint.y = wheel.y;
                        zoomIn(wheel.x,wheel.y);
                    }
                    else if(wheel.angleDelta.y<0 && scaleLevel>=-10){//图像缩小处理
                        imageMain.transformOriginPoint.x = wheel.x;
                        imageMain.transformOriginPoint.y = wheel.y;
                        zoomOut(wheel.x,wheel.y);
                    }
                }
            }

            RotationAnimation
            {
                id:rotationAnimation
                target: imageMain
                to:rotationAngle + 90
                direction: RotationAnimation.Clockwise;
                duration: 500
            }

        }

        Timer
        {
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered:
            {
                imageMain.source = "";
                imageMain.source = "image://imgProvider/hello"
//                console.log("<<<<<<<<<<<<<<<<<<<<<<<<<<<Fresh");
                imageItem.processImage();
//                console.log("---------------------------Fresh");
//                console.log(imageMain.width +" "+ imageMain.height);
                if(imageItem.getGlobalWidth()!==0)
                {
                    mainImageWidth = imageItem.getGlobalWidth();
                    mainImageHeight = imageItem.getGlobalHeight();
                }

            }
        }

    }



    Column
    {
        z: 0.4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 80;
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
                imageItem.retrieval();
                console.log(nIndex);
            }
        }

    }



}
