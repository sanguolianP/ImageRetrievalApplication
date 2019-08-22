import QtQuick 2.0

Rectangle {

    id: rect_leftArea;

    color: "#413d5b";

    Row
    {
        id: lefttoolbuttonList;

        anchors.right: parent.right;
        anchors.rightMargin: 20;
        anchors.top: parent.top;
        anchors.topMargin: 100;

        width: 45 * 5;
        height: 35;

        spacing: 8;

        LeftToolButton
        {
            anchors.verticalCenter: parent.verticalCenter;

            width: 33;
            height: 33;
        }
        LeftToolButton
        {
            anchors.verticalCenter: parent.verticalCenter;

            width: 33;
            height: 33;
        }
        LeftToolButton
        {
            anchors.verticalCenter: parent.verticalCenter;

            width: 33;
            height: 33;
        }
        LeftToolButton
        {
            anchors.verticalCenter: parent.verticalCenter;

            width: 33;
            height: 33;
        }
        LeftToolButton
        {
            anchors.verticalCenter: parent.verticalCenter;

            width: 33;
            height: 33;
        }
    }



}
