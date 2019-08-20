import QtQuick 2.0

Rectangle {

    id: rect_MenuBar;
    z: 0.6;
    Image
    {
        id: imageBG_menuBar;
        anchors.fill: parent;
        source: "images/Toolbar/ToolbarBG.png";
    }


    Row
    {
        id: row_menuBarButtonList;

        anchors.left: parent.left;
        anchors.leftMargin: 30;
        anchors.top: parent.top;
        height: parent.height;
        spacing: 30;


        MyMenuButton
        {
            id:fileButton_Menu;
            width: 120;
            height: 62;
            nTextSize: 25;
            sTextText: "文件"
            state: "normal";
            nIndex: 0;

        }
        MyMenuButton
        {
            id:dbButton_Menu;
            width: 120;
            height: 62;
            nTextSize: 25;
            sTextText: "数据库"
            state: "normal";
            nIndex: 1;
        }
        MyMenuButton
        {
            id:helpButton_Menu;
            width: 120;
            height: 62;
            nTextSize: 25;
            sTextText: "帮助"
            state: "normal";
            nIndex: 2;
        }

    }

    Rectangle
    {
        id: rect_MenuFile;
        visible: false;

        x:fileButton_Menu.x + 4;
        y:fileButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 4 +6;
        color: "transparent";

        Column
        {
            id: colum_File;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "打开图片";
                state: "normal";
                nIndex: 3;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "退出程序";
                state: "normal";
                nIndex: 4;
            }
        }
    }


    Rectangle
    {
        id: rect_MenuDb;
        visible: false;

        x:editButton_Menu.x + 4;
        y:editButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 4 +6;
        color: "transparent";

        Column
        {
            id: colum_Db;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "本地数据库";
                state: "normal";
                nIndex: 5;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "连接数据库";
                state: "normal";
                nIndex: 6;
            }
        }
    }

    Rectangle
    {
        id: rect_MenuHelp;
        visible: false;

        x:toolButton_Menu.x +4;
        y:toolButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 30 * 3 +6;
        color: "transparent";

        Column
        {
            id: colum_Help;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "使用说明";
                state: "normal";
                nIndex: 7;
            }
            MyMenuButton
            {
                width: 200;
                height: 30;
                nTextSize: 16;
                sTextText: "关于我们";
                state: "normal";
                nIndex: 8;
            }

        }
    }


    MouseArea
    {
        id:menuAllMouseArea;
        visible: false;
        z:-1;
        width: mainW.width;
        height: mainW.height;

        onClicked:
        {
            console.log("visible");
            rect_MenuFile.visible = false;
            rect_MenuDb.visible = false;
            rect_MenuHelp.visible = false;

            menuAllMouseArea.visible = false;
            console.log("set success");
        }

    }


}
