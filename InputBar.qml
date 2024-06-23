import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {


    height: parent.height * 0.1
    anchors.top: parent.top
    anchors.topMargin: 8
    anchors.horizontalCenter: parent.horizontalCenter
    Layout.fillWidth: true
    Layout.maximumWidth: parent.width
    layoutDirection: Qt.LeftToRight
    Layout.alignment: Qt.AlignHCenter
    uniformCellSizes: false
    RowLayout {
        id: flow1
    }

    InputButtons {
        id: buttons
    }
}
