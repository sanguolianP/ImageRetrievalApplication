import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {

    id: rect_rightArea;

    color: "#413d5b";
    Image {
        id: vrightarrow;
        source: "images/MainInterface/right/rightDrag";
        width: 8;
        height:10;

        anchors.left: parent.left;
        anchors.leftMargin: 3;
        anchors.verticalCenter: parent.verticalCenter;

    }
    Image {
        id: vbackgroundimage;
        source: "images/MainInterface/right/background.png";
        width: 250;
        height: 250;

        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5;
    }


    ComboBox
    {
        anchors.top: parent.top;
        anchors.topMargin: 20;
        anchors.right: parent.right;
        anchors.rightMargin: 20;
        width: 120;
        height: 40;

        model: ["小", "中", "大"];
        style:ComboBoxStyle
        {
            dropDownButtonWidth:20;
            background:Rectangle
            {
                implicitHeight: 24;
                color: "#ffffff";
            }
        }
    }


    Text {
        id: txtPage
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 80;
        anchors.horizontalCenter: parent.horizontalCenter;
        font.family: "microsoft yahei";
        font.pixelSize: 20;
        color: "#ffffff";
        text: qsTr("第1页");
    }
    PageNavigation
    {
        id: pagenavi;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 40;
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
        color: "transparent";
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


        Timer
        {
            interval: 1000;
            running: true;
            repeat: true;
            onTriggered:
            {
                searchImage_0.source = "";
                searchImage_0.source = "image://imgProvider/0";

                searchImage_1.source = "";
                searchImage_1.source = "image://imgProvider/1";

                searchImage_2.source = "";
                searchImage_2.source = "image://imgProvider/2";

                searchImage_3.source = "";
                searchImage_3.source = "image://imgProvider/3";

                searchImage_4.source = "";
                searchImage_4.source = "image://imgProvider/4";

                searchImage_5.source = "";
                searchImage_5.source = "image://imgProvider/5";

                searchImage_6.source = "";
                searchImage_6.source = "image://imgProvider/6";

                searchImage_7.source = "";
                searchImage_7.source = "image://imgProvider/7";

                searchImage_8.source = "";
                searchImage_8.source = "image://imgProvider/8";
            }
        }

        Rectangle
        {

            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_0;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/0";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }

        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_1;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/1";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_2;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/2";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_3;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/3";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_4;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/4";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_5;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/5";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_6;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/6";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_7;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/7";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }
        Rectangle
        {
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
            {
                id: searchImage_8;

                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                cache: false;
                source: "image://imgProvider/8";

                MouseArea
                {
                    acceptedButtons: "LeftButton";
                    width: parent.width;
                    height: parent.height;
                    onClicked:imageInformation.visible=true;
                }
            }
        }



    }



}
