import QtQuick 2.0
import QtQuick.Window 2.12
Window{
    id:imageInformation
    width: 640
    height: 480
    visible:false;
Rectangle
{

    property var imageRotate: 0;
    property var imageScale: 1;
    id:vShowWindow;
    width: parent.width;
    height: parent.height;
    Image {
        id: vIntroductImage;
        width: parent.width*0.5;
        height: parent.height*0.5;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin:50;
        source: "images/MainInterface/left/image.png";
        rotation: imageRotate;
        scale: imageScale;
    }

    Rectangle
    {
        id:vButtomTop;
        width: 180;
        height: 30;
       // anchors.right: leftSplit.right;
       // anchors.rightMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: vIntroductImage.bottom;
        anchors.topMargin: 10
        color: "transparent";

        Row
        {
            id:vBottomButton;
            anchors.left: parent.left;
            width: parent.width;
            height: 30;
            spacing: 7;
            LeftToolButton
            {
                id:vpencil;
                width: 25;
                height: 25;
                sButtoncolor: "transparent";
                sPressedImage: "images/MainInterface/right/Larger_ImagePress.png";
                sHoverImage: "images/MainInterface/right/Larger_Image.png";
                sNormalImage: "images/MainInterface/right/Larger_ImagePress.png";
                state: "normal";
                onBack: {
                    //imageScale=imageScale+0.2;

                }
            }
            LeftToolButton
            {
                id:vLarger;
                width: 25;
                height: 25;
                sButtoncolor: "transparent";
                sPressedImage: "images/MainInterface/right/Smaller_ImagePress.png";
                sHoverImage: "images/MainInterface/right/Smaller_Image.png";
                sNormalImage: "images/MainInterface/right/Smaller_ImagePress.png";
                state: "normal";
                onBack: {
                    //imageScale=imageScale-0.2;


                }
            }
            LeftToolButton
            {
                id:vSmaller;
                width: 25;
                height: 25;
                sButtoncolor: "transparent";
                sPressedImage: "images/MainInterface/right/leftPress.png";
                sHoverImage: "images/MainInterface/right/left.png";
                sNormalImage: "images/MainInterface/right/leftPress.png";
                state: "normal";
                onBack: {

                }
            }
            LeftToolButton
            {
                id:vRotate;
                width: 25;
                height: 25;
                sButtoncolor: "transparent";
                sPressedImage: "images/MainInterface/right/rightPress.png";
                sHoverImage: "images/MainInterface/right/right.png";
                sNormalImage: "images/MainInterface/right/rightPress.png";
                state: "normal";
                onBack: {


                }
            }
            LeftToolButton
            {
                id:vFrame;
                width: 25;
                height: 25;
                sButtoncolor: "transparent";
                sPressedImage: "images/MainInterface/right/rotate_ImagePress.png";
                sHoverImage: "images/MainInterface/right/rotate_Image.png";
                sNormalImage: "images/MainInterface/right/rotate_ImagePress.png";
                state: "normal";
//                onBack: {
//                    imageRotate=imageRotate+90;

//                }
            }

        }//Row
    }
    Rectangle
    {
        id:vTextIntroduct;
        height: 80;
        width: parent.width*0.5;
        anchors.top: vButtomTop.bottom;
        anchors.topMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
        border.color: "#a7a7a7";
        border.width: 2;
    }
}
}
