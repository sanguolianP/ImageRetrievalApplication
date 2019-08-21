import QtQuick 2.0
//import QtQuick.Dialogs 1.2

Rectangle {

    id: menu_Button;

    color: "transparent";

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sTextText: "";
    property var nTextSize: 12;
    property var nIndex: 0;


    signal menuButtonIndexBack(var nIndex);

    Row
    {
        id: menubuttonRowInner;
//        anchors.fill: parent;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 15;

        Text {
            id: menuButtonText;
            anchors.verticalCenter: parent.verticalCenter;
//            width: parent.width;
//            height: parent.height;
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
            wrapMode: Text.WordWrap;
            color: "#ffffff";
            font.family: "微软雅黑";
            font.pixelSize: nTextSize;
            font.letterSpacing: 1;
    //        font.bold: true;
            text: sTextText;
        }
        Image
        {
            id: menuButtonImage;
            anchors.verticalCenter: parent.verticalCenter;
            source: sNormalImage;
        }
    }






    MouseArea
    {
        id: menuButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton ;
        hoverEnabled: true;
        onPressed:
        {
            menu_Button.state = "pressed";

            if(nIndex == 0)
            {
                rect_MenuFile.visible = true;
                rect_MenuDb.visible = false;
                rect_MenuHelp.visible = false;
            }
            if(nIndex == 1)
            {
                rect_MenuDb.visible = true;
                rect_MenuFile.visible = false;
                rect_MenuHelp.visible = false;
            }
            if(nIndex == 2)
            {
                rect_MenuHelp.visible = true;
                rect_MenuFile.visible = false;
                rect_MenuDb.visible = false;
            }
            menuAllMouseArea.visible = true;
        }
        onReleased:
        {
            menuButtonIndexBack(nIndex);
            console.log("release->menuButton");
            if(nIndex>3)
            {
                rect_MenuFile.visible = false;
                rect_MenuDb.visible = false;
                rect_MenuHelp.visible = false;
            }
            menu_Button.state = "hover";

        }
        onEntered:
        {
            if(menu_Button.state === "normal")
                menu_Button.state = "hover";
            console.log("enter->menuButton");
            menu_Button.color = "#1c0f4e";
        }
        onExited:
        {
            if(menu_Button.state === "hover")
                menu_Button.state = "normal";
            console.log("exit->menuButton");
            menu_Button.color = "#352e57";
        }
        onClicked:
        {

        }

    }



    states: [
        State {
            name: "normal";
            PropertyChanges {
                target: menuButtonImage;
                source: sNormalImage;
            }
        },
        State {
            name: "pressed";
            PropertyChanges {
                target: menuButtonImage;
                source: sPressedImage;
            }
        },
        State {
            name: "hover";
            PropertyChanges {
                target: menuButtonImage;
                source: sHoverImage;
            }
        }
    ]


}
