import QtQuick 2.0
import QtQuick.Window 2.12
import Imagepro 1.1

Window
{
    width: 1280;
    height: 720;
    visible: true;
    color: "white";

    Image
    {
        id: chooserectImage;
        cache:false;
        source: "image://imgProvider/hello";
    }

    Timer
    {
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered:
        {
            chooserectImage.source = "";
            chooserectImage.source = "image://imgProvider/hello"
        }
    }

}
