import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle{
    id: title_Button;

    z:0.5;
    color: "transparent";

    //------------------------------------------------------------//

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";

    property var nIndex: 0;

    signal back(var nIndex);

    //------------------------------------------------------------//

    //button image
    Image
    {
        id: titleButtonImage;

        anchors.fill: parent;
        source: sNormalImage;
    }



    MouseArea
    {
        id: titleButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        hoverEnabled: true;

        onPressed:
        {
            title_Button.state = "pressed";
        }
        onReleased:
        {
            title_Button.state = "normal";
            back(nIndex);
        }

        onEntered:
        {
            if(title_Button.state === "normal")
            {
                title_Button.state = "hover";
            }

            /* state === "normal" ? state = "hover" : state = "pressed"; */
        }
        onExited:
        {
            if(title_Button.state === "hover")
            {
                title_Button.state = "normal";
            }

            /* state === "hover" ? state = "normal" : state = "pressed"; */
        }

        onClicked:
        {
            if(nIndex == 0)
                mainW.visibility = Window.Minimized;
            if(nIndex == 1)
            {
                mainW.visibility === Window.Windowed ?
                            mainW.visibility = Window.Maximized :mainW.visibility = Window.Windowed;
            }

            if(nIndex == 2)
                Qt.quit();
        }
    }


    states: [
        State
        {
            name: "normal";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sNormalImage;
            }
        },
        State
        {
            name: "pressed";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sPressedImage;
            }
        },
        State
        {
            name: "hover";
            PropertyChanges
            {
                target: titleButtonImage;
                source: sHoverImage;
            }
        }
    ]

}

