import QtQuick
import QtQuick.Controls
import Plotterthing
import QtCharts


TextField {
    id: textfield
    placeholderText: qsTr("delete?")
    placeholderTextColor: "white"
    verticalAlignment: TextInput.AlignVCenter
    horizontalAlignment: TextInput.AlignHCenter
    font.bold: true
    color: "white"
    padding: 3
    font.pixelSize: 20

    onEditingFinished: createLine()
    onAccepted: destroywhenempty()
    onTextEdited: { adjustWidth(); deleteText(); }

    background: Rectangle {
        color: "lightblue"
        radius: 5
        border.color: "#333"
        border.width: 1

    }


    Plotter {
        id: plotter
        xAxis: axisX
        yAxis: axisY
        Component.onDestruction: myChart.removeSeries(getReference())
    }

    function adjustWidth() {
        if(contentWidth < 300){

        }else {
            width = contentWidth;
        }
    }

    function destroywhenempty() {
        if(text === qsTr("")) {
            textfield.destroy();
        }
    }

    function deleteText() {
        if(text === qsTr("")) {
            textfield.placeholderText = qsTr("delete?");
        } else {
            textfield.placeholderText = qsTr("");
        }
    }

    function createLine() {

        var line;
        if(myChart.series(plotter.Name) === null) {
            line = myChart.createSeries(ChartView.SeriesTypeLine, plotter.Name, axisX, axisY);
        } else {
            line = myChart.series(plotter.Name);
        }

        plotter.Text = text;
        plotter.appendList(line);
    }

}


