import QtQuick 2.0

Rectangle {

    id: rect_StatusBar;
    anchors.horizontalCenter: parent.horizonralCenter;

    Text {
        id: logText;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.verticalCenter: parent.verticalCenter;

        width:200;
        height: parent.height-4;

        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.WordWrap;

        color: "#ffffff";

        font.family: "微软雅黑";
        font.pixelSize: 18;
        font.letterSpacing: 1;

        text: qsTr("就绪");
    }

}
