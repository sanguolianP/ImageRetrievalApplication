import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1

Rectangle {

    id: rect_rightArea;

    color: "#413d5b";

    GridLayout
    {
        anchors.top: parent.top;
        anchors.topMargin: 100;
        anchors.horizontalCenter: parent.horizontalCenter;

        width: 700;
        height: 700;
        rows: 10;
        columns: 3;

        rowSpacing: 20;
        columnSpacing: 20;

        Button
        {
            width: 170;
            height: 170;
        }
        Button
        {
            width: 170;
            height: 170;
        }
        Button
        {
            width: 170;
            height: 170;
        }
        Button
        {
            width: 170;
            height: 170;
        }
        Button
        {
            width: 170;
            height: 170;
        }





    }


}
