import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtCharts

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
        icon.name: "color"
        onTriggered: colorDialog.open()
    }

    Menu {
        title: qsTr("Axes")

        CheckBox {
            text: qsTr("show Y Axes?")
            checked: true
            onCheckedChanged: {
                axisY.visible = checked ? true : false
            }
        }
        CheckBox {
            text: qsTr("show X Axes?")
            checked: true
            onCheckedChanged: {
                axisX.visible = checked ? true : false
            }
        }

        CheckBox {
            text: qsTr("show Y Grid?")
            checked: true
            onCheckedChanged: {
                axisY.gridVisible = checked ? true : false
            }
        }
        CheckBox {
            text: qsTr("show X Grid?")
            checked: true
            onCheckedChanged: {
                axisX.gridVisible = checked ? true : false
            }
        }
    }

    //Item: ["Anzeige"]
}
