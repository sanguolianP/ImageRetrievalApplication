import QtQuick 2.0
import QtQuick.Window 2.12
Window{


    id:vLinkWindow;
    width: 560;
    height: 270;
    visible: false;
    color: "#352e57"
   flags: Qt.FramelessWindowHint
    Image {
        id: urlbackground;
        source: "images/MainInterface/right/background.png";
        width: 116;
        height: 95;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom

        }
    Rectangle
    {
        id:vTitle;
        color: "#1c0f4e";
        width: parent.width;
        height: 63;
        Text {
         //   id: name
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            text: qsTr("连接数据库")

            color: "white";
            font.pixelSize: 20;

        }
        MouseArea
        {
            anchors.right: parent.right;
           // anchors.rightMargin: 400;
            anchors.top: parent.top;

            height: parent.height;
            width: parent.width;


            acceptedButtons: Qt.LeftButton //只处理鼠标左键
            property point cPos: "0,0"
            onPressed:
            {
                //接收鼠标按下事件
                cPos  = Qt.point(mouse.x,mouse.y)
            }
            onPositionChanged:
            {
                //鼠标按下后改变位置
                //鼠标偏移量
                var delta = Qt.point(mouse.x-cPos.x, mouse.y-cPos.y)

                //如果mainwindow继承自QWidget,用setPos
                vLinkWindow.setX(vLinkWindow.x+delta.x)
                vLinkWindow.setY(vLinkWindow.y+delta.y)
            }

    }
//    Rectangle{
//        id:vLink_Url;
//        width: parent.width;
//        height: 203;

        Rectangle
        {
            id:url_link;
            color: "transparent";
            anchors.fill:parent;
            Text {
                id: urldirect
                anchors.left: parent.left;
                anchors.leftMargin: 90;
                anchors.top: parent.top;
                anchors.topMargin: 100;
                text: qsTr("url:")
                color: "white"
                font.pixelSize: 30;
            }
            Rectangle{
                anchors.left: parent.left;
                color: "white"
                anchors.leftMargin: 160;
                anchors.top: parent.top;
                anchors.topMargin: 100;
                width: 250;
                height: 25;
            TextInput{

               // width:120;
              //  height: 25;
                font.pixelSize: 20;
                anchors.centerIn: parent;
              //  validator: RegExpValidator{
              //  }
               // inputMask: "http://000.000.000";
                focus: true;

            }
            }

            RetrievalButton{
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
                anchors.topMargin: 150;
                width:150;
                height: 50;
                sPressedImage: "images/MainInterface/left/retrievalOn.png";
                sNormalImage: "images/MainInterface/left/retrieval.png";
                sHoverImage: "images/MainInterface/left/retrievalOn.png";
                state: "normal";
                sTextText: "连接";
                nTextSize: 20;

                onRetrievalButtonIndexBack:
                {


                }
        }
        }

//    }


        }

}
