import QtQuick 2.0
import Felgo 3.0

Item {
    id: buttonBase

    // public events
    signal clicked
    signal pressed
    signal released

    property string defaultColor: "red"
    property string pressedColor: "blue"
    property alias color: background.color
    property alias text: buttonText.text
    property alias pixelSize: buttonText.font.pixelSize

    // button background
    Rectangle {
        id: background
        color: defaultColor
        anchors.fill: parent
    }

    // button text
    Text {
        id: buttonText
        color: "white"
        anchors.centerIn: background
    }

    // mouse area to handle click events
    MouseArea {
        id: mouseArea
        anchors.fill: background

        onPressed: button.pressed()
        onReleased: button.released()
        onClicked: button.clicked()
    }
}
