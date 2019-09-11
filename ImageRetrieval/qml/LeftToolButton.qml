import QtQuick 2.0


Rectangle{
    id: lefttool_Button;

    color: "transparent";

    //------------------------------------------------------------//

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sButtoncolor: "";

    property var nIndex: 0;

    signal back(var nIndex);

    //------------------------------------------------------------//

    //button image
    Image
    {
        id: lefttoolButtonImage;

        anchors.fill: parent;
        source: sNormalImage;
    }



    MouseArea
    {
        id: lefttoolButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        hoverEnabled: true;

        onPressed:
        {
            lefttool_Button.state = "pressed";
        }
        onReleased:
        {
            lefttool_Button.state = "normal";
            back(nIndex);
        }

        onEntered:
        {
            if(lefttool_Button.state === "normal")
            {
                lefttool_Button.state = "hover";
            }
          //  lefttool_Button.color = "#352e57";
            lefttool_Button.color = sButtoncolor;
            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(lefttool_Button.state === "hover")
            {
                lefttool_Button.state = "normal";
            }
            lefttool_Button.color = "transparent";
            /* state === "hover" ? state = "normal" : state = "pressed"; */
        }

        onClicked:
        {
        }
    }


    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: lefttoolButtonImage;
                source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: lefttoolButtonImage;
                source: sPressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: lefttoolButtonImage;
                source: sHoverImage;
            }
        }
    ]

}

