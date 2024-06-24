

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import QtCharts

Rectangle {
    id: rectangle
    color: "#c7f7ff"


    InputBar {
        id: inputBar
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
    }

    ComboBox {
        id: comboBox
        anchors.margins: 5
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        displayText: "Settings"
        model: ["SVG Export", "Png Export", "Anzeige", "Hintergrundfarbe"]
    }


    ChartView {
        id: myChart

        width: parent.width * 0.9
        height: parent.height * 0.8

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        theme: ChartView.ChartThemeBlueCerulean

        ValuesAxis {
            id: axisY
            gridVisible: true
            tickCount: 5
            min: -6
            max: 6
            onRangeChanged: {

            }
        }

        ValuesAxis {
            id: axisX
            min: -6
            max: 6
            gridVisible: true
            tickCount: 5
        }


        MouseArea {
            anchors.fill: parent
            scrollGestureEnabled: true
            drag.target: dragTarget
            drag.axis: Drag.XAndYAxis
            onWheel: (wheel) => {
                         if (Qt.ControlModifier & wheel.modifiers) {
                             if (wheel.angleDelta.y > 0) {
                                 myChart.zoom(1.035)
                             }else if(wheel.angleDelta.y < 0) {
                                 myChart.zoom(0.965)
                             }
                         } else {
                             dragTarget.x += wheel.angleDelta.x * 0.7
                             dragTarget.y += wheel.angleDelta.y * 0.7
                             wheel.accepted = true
                         }
                     }
            onDoubleClicked: {
                myChart.zoomReset();
            }
        }

        Item {
            // A virtual item to receive drag signals from the MouseArea.
            // When x or y properties are changed by the MouseArea's
            // drag signals, the ChartView is scrolled accordingly.
            id: dragTarget

            property real oldX : x
            property real oldY : y

            onXChanged: {
                myChart.scrollLeft( x - oldX );
                oldX = x;
            }
            onYChanged: {
                myChart.scrollUp( y - oldY );
                oldY = y;
            }
        }
    }
}
