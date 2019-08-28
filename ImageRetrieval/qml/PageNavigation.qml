import QtQuick 2.0
import QtQuick.Controls 2.0

Row{
    id: pageNavigation
    property int nCout: 1
    property int nCurPage: 1
    property int nPageSize: 1

    signal sCurPage(int curPage);

    Rectangle{
        id: prevPage
        height: 24
        width: 60
        color: "transparent"
        border.color: "#f18e31"
        border.width: 1
        Row{
            anchors.centerIn: parent
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 12
                color: "#ffffff";
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("上一页")
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if (pageNavigation.nCurPage > 1) pageNavigation.nCurPage--;
            }
        }
    }

    Repeater{
        id: repeater
        model: pageNavigation.nPageSize



        delegate: Rectangle{
            property int nCurIndex: (pageNavigation.nCurPage-1)*pageNavigation.nPageSize + index + 1
            property bool hasPage: nCurIndex <= pageNavigation.nCout

            height: 24
            width: 24
            color: "transparent"
            border.color: "#f18e31"
            border.width: hasPage ? 1 : 0

            Text {
                id: deleColor;
                font.family: "arial"
                font.pixelSize: 17
                color: "#707070";
                anchors.centerIn: parent
                text: nCurIndex
                visible: hasPage ? true : false
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: hasPage
                onEntered: {
                    deleColor.color = "#ffffff";
                }
                onExited: {
                    deleColor.color = "#707070";
                }
                onPressed: {
                    emit: sCurPage(nCurIndex);
                }
            }
        }
    }

    Rectangle{
        id: nextPage
        height: 24
        width: 60
        color: "transparent"
        border.color: "#f18e31"
        border.width: 1
        Row{
            anchors.centerIn: parent
            Text {
                font.family: "microsoft yahei"
                font.pixelSize: 12
                color: "#ffffff";
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("下一页")
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if (pageNavigation.nCurPage*pageNavigation.nPageSize <= pageNavigation.nCout) pageNavigation.nCurPage++;
            }
        }
    }
}
