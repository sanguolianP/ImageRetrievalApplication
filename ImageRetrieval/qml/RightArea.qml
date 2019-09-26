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

        Rectangle
        {
//            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;
//            width: 100;
//            height: 100;
            Layout.fillWidth: true;
            Layout.fillHeight: true;
            color: "transparent";
            Image
          //  Rectangle
            {
                id: searchImage_0;
                source: "image://imgProvider/0";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
              //  anchors.fill:searchImage_1;
              //  color: "#0000ff";
//                Image {
//                    id: searchImage_1;
//                    source: "images/MainInterface/left/image.png";

//                }
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
        //    Rectangle
            {
                id: searchImage_1;
                source: "image://imgProvider/1";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
              //  anchors.fill:searchImage_1;
              //  color: "#0000ff";
//                Image {
//                    id: searchImage_1;
//                    source: "images/MainInterface/left/image.png";

//                }
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
                source: "image://imgProvider/2";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
               // color: "#0000ff";
//                anchors.fill:searchImage_2;
//                Image {
//                    id: searchImage_2;
//                    source: "images/MainInterface/left/image.png";

//                }
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
                source: "image://imgProvider/3";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                // color: "#0000ff";
//                 anchors.fill:searchImage_3;
//                 Image {
//                     id: searchImage_3;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
                source: "image://imgProvider/4";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                // color: "#0000ff";
//                 anchors.fill:searchImage_4;
//                 Image {
//                     id: searchImage_4;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
                source: "image://imgProvider/5";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                // color: "#0000ff";
//                 anchors.fill:searchImage_5;
//                 Image {
//                     id: searchImage_5;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
                source: "image://imgProvider/6";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                // color: "#0000ff";
//                 anchors.fill:searchImage_6;
//                 Image {
//                     id: searchImage_6;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
                source: "image://imgProvider/7";
                width: 170;
                height: 160;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                // color: "#0000ff";
//                 anchors.fill:searchImage_7;
//                 Image {
//                     id: searchImage_7;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
                // color: "#0000ff";
                source: "image://imgProvider/8";
//                 anchors.fill:searchImage_8;
//                 Image {
//                     id: searchImage_8;
//                     source: "images/MainInterface/left/image.png";

//                 }
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
