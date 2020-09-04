import QtQuick 2.0
import Felgo 3.0

SceneBase {
    id: scene

    Rectangle {
        id: background
        color: "blue"

        anchors.fill: scene.gameWindowAnchorItem
    }

    Text {
        text: "Loading..."
        color: "white"
        font.pixelSize: 26

        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            verticalCenter: scene.gameWindowAnchorItem.verticalCenter
        }
    }
}
