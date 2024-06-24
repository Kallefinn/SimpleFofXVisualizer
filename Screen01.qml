

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
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


    FileDialog {
        id: filedialog
        fileMode: FileDialog.SaveFile
        defaultSuffix: qsTr(".png")
        onAccepted: {myChart.grabToImage(function(result)
            {result.saveToFile(filedialog.selectedFile)})
        }
    }

    ColorDialog {
        id: colorDialog
        onAccepted: myChart.backgroundColor = selectedColor
    }

    Menu {
        id: settings
        title: qsTr("settings")
        visible: false

        Menu {
            title: qsTr("Export")
            MenuItem {
                text: qsTr("Png")

                onTriggered: {filedialog.defaultSuffix = qsTr(".png"); filedialog.open()}
            }
            MenuItem {
                text: qsTr("SVG (not implemented yet)")
            }

        }

        Menu {
            title: qsTr("Style")
            MenuItem {
                text: qsTr("Light")
                onTriggered: myChart.theme = ChartView.ChartThemeLight
            }
            MenuItem {
                text: qsTr("Blue Cerulean")
                onTriggered: myChart.theme = ChartView.ChartThemeBlueCerulean
            }
            MenuItem {
                text: qsTr("Dark")
                onTriggered: myChart.theme = ChartView.ChartThemeDark
            }
            MenuItem {
                text: qsTr("Brown Sand")
                onTriggered: myChart.theme = ChartView.ChartThemeBrownSand
            }
            MenuItem {
                text: qsTr("Blue Ncs")
                onTriggered: myChart.theme = ChartView.ChartThemeBlueNcs
            }
            MenuItem {
                text: qsTr("High Contrast")
                onTriggered: myChart.theme = ChartView.ChartThemeHighContrast
            }
            MenuItem {
                text: qsTr("Blue Icy")
                onTriggered: myChart.theme = ChartView.ChartThemeBlueIcy
            }
            MenuItem {
                text: qsTr("Qt")
                onTriggered: myChart.theme = ChartView.ChartThemeQt
            }
        }
        MenuItem {
            text: qsTr("Background Color")
            onTriggered: colorDialog.open()
        }

        //Item: ["Anzeige"]
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
        }

        ValuesAxis {
            id: axisX
            min: -6
            max: 6
            gridVisible: true
            tickCount: 5
        }


        MouseArea {
            id: touchMode
            anchors.fill: parent
            scrollGestureEnabled: true

            //Zoom and Panning
            onWheel: (wheel) => {
                         wheel.accepted = true
                         if (Qt.ControlModifier & wheel.modifiers) {
                             if (wheel.angleDelta.y > 0) {
                                 myChart.zoom(1.035)
                             }else if(wheel.angleDelta.y < 0) {
                                 myChart.zoom(0.965)
                             }
                         } else {
                             dragTarget.x += wheel.angleDelta.x * 0.7
                             dragTarget.y += wheel.angleDelta.y * 0.7
                         }
                     }

            MouseArea {
                id: mouseMode
                anchors.fill: parent
                scrollGestureEnabled: false
                propagateComposedEvents: true
                drag.target: dragTarget
                drag.axis: Drag.XAndYAxis

                acceptedButtons: {Qt.LeftButton | Qt.RightButton}
                onPressed: {

                    if(pressedButtons & Qt.RightButton) {
                        settings.popup()
                    }
                }

                onWheel: (wheel) => {
                             wheel.accepted = true
                             if (wheel.angleDelta.y > 0) {
                                 myChart.zoom(1.035)
                             }else if(wheel.angleDelta.y < 0) {
                                 myChart.zoom(0.965)
                             }
                         }
                onDoubleClicked: {
                    myChart.zoomReset();
                }
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
