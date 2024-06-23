import QtQuick
import QtQuick.Controls
import Plotterthing
import QtCharts
import QtQuick.Layouts

Window {
    id: window

    visible: true
    title: qsTr("Hello World")
    width: 1060
    height: 600
    Screen01 {
        anchors.fill: parent
    }
}
