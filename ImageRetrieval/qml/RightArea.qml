import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1

Rectangle {

    id: rect_rightArea;

    color: "#413d5b";

    PageNavigation
    {
        id: pagenavi;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20;
        anchors.horizontalCenter: parent.horizontalCenter;
        nCout: 23
        nCurPage: 1
        nPageSize: 5
        onSCurPage: {
            txtPage.text = qsTr("第") + curPage + qsTr("页");
        }
    }

    Rectangle
    {
        anchors.fill: gridArea;
        color: "#aaaaaa";
    }
    GridLayout
    {
        id: gridArea;
        anchors.top: parent.top;
        anchors.topMargin: 100;
//        anchors.bottom: parent.bottom;
//        anchors.bottomMargin: 100;
//        anchors.left: parent.left;
//        anchors.leftMargin: 100;
//        anchors.right: parent.right;
//        anchors.rightMargin: 100;

//        anchors.fill: parent;
//        anchors.margins: 100;

        width: 800;
        height: 600;
        anchors.horizontalCenter: parent.horizontalCenter;


//        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
//        Layout.alignment: ;
        flow: GridLayout.LeftToRight;
        rows: 3;
        columns: 3;

        rowSpacing: 50;
        columnSpacing: 50;


//        Layout.alignment: Qt.AlignVCenter;

        Rectangle
        {
//            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
//            width: 100;
//            height: 100;
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
        }

        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "#eeeeee";
            Rectangle
            {
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#0000ff";
            }
        }








    }


}
