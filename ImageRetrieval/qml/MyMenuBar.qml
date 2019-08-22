import QtQuick 2.0

Rectangle {

    id: rect_MenuBar;
    z: 0.6;
//    Image
//    {
//        id: imageBG_menuBar;
//        anchors.fill: parent;
//        source: "images/Toolbar/ToolbarBG.png";
//    }


    Row
    {
        id: row_menuBarButtonList;

        anchors.left: parent.left;
        anchors.leftMargin: 20;
        anchors.top: parent.top;
        height: parent.height;
        spacing: 10;


        MyMenuButton
        {
            id:fileButton_Menu;
            width: 140;
            height: 62;
            nTextSize: 26;
            sTextText: "文件"
            sPressedImage: "images/MenuBar/fileHover.png";
            sNormalImage: "images/MenuBar/file.png";
            sHoverImage: "images/MenuBar/fileHover.png";
            state: "normal";
            nIndex: 0;

        }
        MyMenuButton
        {
            id:dbButton_Menu;
            width: 140;
            height: 62;
            nTextSize: 26;
            sTextText: "数据库"
            sPressedImage: "images/MenuBar/dbHover.png";
            sNormalImage: "images/MenuBar/db.png";
            sHoverImage: "images/MenuBar/dbHover.png";
            state: "normal";
            nIndex: 1;
        }
        MyMenuButton
        {
            id:helpButton_Menu;
            width: 140;
            height: 62;
            nTextSize: 26;
            sTextText: "帮助"
            sPressedImage: "images/MenuBar/helpHover.png";
            sNormalImage: "images/MenuBar/help.png";
            sHoverImage: "images/MenuBar/helpHover.png";
            state: "normal";
            nIndex: 2;
        }

    }

    Rectangle
    {
        id: rect_MenuFile;
        visible: false;

        x:fileButton_Menu.x + 20;
        y:fileButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 52 * 2 ;
        color: "transparent";

        Column
        {
            id: colum_File;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "打开图片";
                sPressedImage: "images/MenuBar/openHover.png";
                sNormalImage: "images/MenuBar/open.png";
                sHoverImage: "images/MenuBar/openHover.png";
                state: "normal";
                nIndex: 3;
            }
            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "退出程序";
                sPressedImage: "images/MenuBar/quitHover.png";
                sNormalImage: "images/MenuBar/quit.png";
                sHoverImage: "images/MenuBar/quitHover.png";
                state: "normal";
                nIndex: 4;
                onMenuButtonIndexBack:
                {
                    Qt.quit();
                }
            }
        }
    }


    Rectangle
    {
        id: rect_MenuDb;
        visible: false;

        x:dbButton_Menu.x + 20;
        y:dbButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 52 * 2;
        color: "transparent";

        Column
        {
            id: colum_Db;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "本地数据库";
                sPressedImage: "images/MenuBar/localdbHover.png";
                sNormalImage: "images/MenuBar/localdb.png";
                sHoverImage: "images/MenuBar/localdbHover.png";
                state: "normal";
                nIndex: 5;
            }
            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "连接数据库";
                sPressedImage: "images/MenuBar/connectdbHover.png";
                sNormalImage: "images/MenuBar/connectdb.png";
                sHoverImage: "images/MenuBar/connectdbHover.png";
                state: "normal";
                nIndex: 6;
            }
        }
    }

    Rectangle
    {
        id: rect_MenuHelp;
        visible: false;

        x:helpButton_Menu.x + 20;
        y:helpButton_Menu.y + menuBar_mainWin.height;
        width: 200;
        height: 52 * 2;
        color: "transparent";

        Column
        {
            id: colum_Help;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;

            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "使用说明";
                sPressedImage: "images/MenuBar/manualHover.png";
                sNormalImage: "images/MenuBar/manual.png";
                sHoverImage: "images/MenuBar/manualHover.png";
                state: "normal";
                nIndex: 7;
            }
            MyMenuButton
            {
                width: 200;
                height: 52;
                nTextSize: 20;
                sTextText: "关于我们";
                sPressedImage: "images/MenuBar/aboutusHover.png";
                sNormalImage: "images/MenuBar/aboutus.png";
                sHoverImage: "images/MenuBar/aboutusHover.png";
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
