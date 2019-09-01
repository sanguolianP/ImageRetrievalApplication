import QtQuick 2.0

Rectangle {
    id: colorSquare;
    width: 30; height: 30
    color: "green"
    signal clicked
    signal pressed



    property bool active: false
    property var sButtonImage: "";
    border.color: active? "#666666" : "#f0f0f0"
//    property var normalColor: "#666666";
    border.width: 2;
//    border.color: normalColor;
// signal back(var nIndex);
    Rectangle{
        width: 28;
        height: 28;
        color: "transparent"
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;

    Image {


                    id: eraseImage
                    anchors.fill:parent;
                   // source: "image/erase.png"
                   // anchors.horizontalCenter: parent.horizontalCenter;
                   // anchors.verticalCenter: parent.verticalCenter;
                    source: sButtonImage;
                   // anchors.horizontalCenter: parent.horizontalCenter;
                   // anchors.verticalCenter: parent.verticalCenter;

                }
    }
    MouseArea {
        id: area
        anchors.fill :parent
        onPressed:  {
            colorSquare.pressed()
        }
}
}
