import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window{

    id: vPaint;
    width: 640
    height: 480
    visible: true
    color: "white";
    //flags: Qt.FramelessWindowHint
//Rectangle{
//    width: parent.width;
//    height: parent.height;
//    id:vpaintcanvas;
   Rectangle{
       // anchors.fill: canvas
       id:vcanvasfill;
        height: 280;
        width: 400;
        anchors.horizontalCenter: parent.horizontalCenter;
           anchors.verticalCenter: parent.verticalCenter;
        border.color: "#666"
        border.width: 4;

    Canvas{
        id:canvas;
        width:parent.width;
        height:parent.height;


　　　　　　//鼠标点击坐标位置
        property real lastX
        property real lastY
       //  property color color: colorTools.paintColor
        property color paintcolor: "black";

        onPaint: {

            var ctx = getContext("2d")

            ctx.lineWidth = 5
            ctx.strokeStyle = canvas.paintcolor;
           // ctx.strokeStyle ="black";
            ctx.beginPath()
            ctx.moveTo(lastX,lastY)
            lastX = area.mouseX;
            lastY = area.mouseY;
            ctx.lineTo(lastX,lastY)
            ctx.stroke()
        }
        MouseArea{
            id:area;
            anchors.fill: parent;
            onPressed: {
                canvas.lastX = mouseX;
                canvas.lastY = mouseY;
            }
            onPositionChanged: {
                canvas.requestPaint()//当鼠标press位置改变  完成当前绘制
            }
        }
    }//canvas
     }
   ColorSquare{
       anchors.right: parent.right;
       anchors.rightMargin: 60;
       anchors.top: parent.top;
       anchors.topMargin: 60;
       id:red;
       sButtonImage: "image/erase.png";
       color: "white";

       active: canvas.paintcolor == color;
       //当选中一个colorSquare时，当前画笔颜色为选中的颜色


       onPressed : {

          canvas.paintcolor = color;
       }
}
   ColorSquare{

       anchors.right: parent.right;
       anchors.rightMargin: 100;
       anchors.top: parent.top;
       anchors.topMargin: 60;
       id:pen;
       sButtonImage: "image/pen.png"
       color: "black";

       active: canvas.paintcolor == color;
       //当选中一个colorSquare时，当前画笔颜色为选中的颜色


       onPressed : {

          canvas.paintcolor = color;
       }
}
   Rectangle{
       id:vpainttitlt;

       width:parent.width;
       height: 50;
       color: "#352e57";
       Text {
           id: vtitlePaint
           text: qsTr("画图");
           color: "white";
           font.pixelSize: 30;
           anchors.horizontalCenter: parent.horizontalCenter;
           anchors.verticalCenter: parent.verticalCenter;

       }
//       Button_Image{
//           anchors.right: parent.right;
//           anchors.rightMargin: 10;
//           anchors.top: parent.top;
//          // anchors.topMargin: 10;
//           width: 70;
//           height: 50;
//           sPressedImage: "image/surePress.png";
//           sHoverImage: "image/surePress.png";
//           sNormalImage: "image/sure.png";
//           state: "normal";
//           onBack: {
//             //  canvas.
//               canvas.save("123.png","png");
//            //   vPaint.close();
//           }
//       }

//       MouseArea{
//           anchors.fill:parent;
//           drag.target: vpaintcanvas;
//           drag.axis:"XAndYAxis";

//       }
//   }
}
}//Window

