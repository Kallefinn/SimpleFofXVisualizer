import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


RoundButton {
    text: "+"
    highlighted: true
    onClicked: createButtonObject()
    function createButtonObject() {

        var component = Qt.createComponent("Text_Input.qml");
        component.createObject(flow1);
    }
}



