import QtQuick

MouseArea {
    id: touchMode
    anchors.fill: parent
    scrollGestureEnabled: true

    //Zoom and Panning
    onWheel: (wheel) => {
                 wheel.accepted = true
                 if (Qt.ControlModifier & wheel.modifiers) {
                     if (wheel.angleDelta.y > 0) {
                         //myChart.zoom(1.035)
                         axisY.min *= 0.965
                         axisY.max *= 0.965
                     }else if(wheel.angleDelta.y < 0) {
                         //myChart.zoom(0.965)
                         axisY.min *= 1.035
                         axisY.max *= 1.035
                     }
                     if (wheel.angleDelta.x > 0) {
                         //myChart.zoom(1.035)
                         axisX.min *= 0.965
                         axisX.max *= 0.965
                     }else if(wheel.angleDelta.x < 0) {
                         //myChart.zoom(0.965)
                         axisX.min *= 1.035
                         axisX.max *= 1.035
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
