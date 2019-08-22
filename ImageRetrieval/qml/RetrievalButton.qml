import QtQuick 2.0


Rectangle {

    id: retrieval_Button;

    color: "transparent";

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sTextText: "";
    property var nTextSize: 12;
    property var nIndex: 0;


    signal retrievalButtonIndexBack(var nIndex);

    Image
    {
        id: retrievalButtonImage;
        anchors.fill: parent;
        source: sNormalImage;
    }
    Text
    {
        id: retrievalButtonText;
//        anchors.horizontalCenter: parent.horizontalCenter;
//        anchors.verticalCenter: parent.verticalCenter;

        anchors.fill: parent;
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

    MouseArea
    {
        id: retrievalButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton ;
        hoverEnabled: true;
        onPressed:
        {
            retrieval_Button.state = "pressed";

        }
        onReleased:
        {
            retrievalButtonIndexBack(nIndex);
            retrieval_Button.state = "hover";

        }
        onEntered:
        {
            if(retrieval_Button.state === "normal")
                retrieval_Button.state = "hover";
        }
        onExited:
        {
            if(retrieval_Button.state === "hover")
                retrieval_Button.state = "normal";
        }
        onClicked:
        {

        }

    }



    states: [
        State {
            name: "normal";
            PropertyChanges {
                target: retrievalButtonImage;
                source: sNormalImage;
            }
        },
        State {
            name: "pressed";
            PropertyChanges {
                target: retrievalButtonImage;
                source: sPressedImage;
            }
        },
        State {
            name: "hover";
            PropertyChanges {
                target: retrievalButtonImage;
                source: sHoverImage;
            }
        }
    ]


}

