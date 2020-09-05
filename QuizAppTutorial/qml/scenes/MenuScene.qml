import QtQuick 2.0
import Felgo 3.0
import "../ui"

SceneBase {
    id: scene

    Rectangle {
        id: background
        color: "lightblue"

        anchors.fill: scene.gameWindowAnchorItem
    }

    Text {
        id: welcomeText

        text: "Welcome to Quiz App!"
        color: "white"
        font.pixelSize: 36

        anchors {
            top: scene.gameWindowAnchorItem.top
            left: scene.gameWindowAnchorItem.left
            right: scene.gameWindowAnchorItem.right
            topMargin: 30
            leftMargin: 30
            rightMargin: 30
        }

        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: highscoreText

        text: "Highscore: 0 / 10"
        color: "white"
        font.pixelSize: 24

        anchors {
            top: welcomeText.bottom
            left: scene.gameWindowAnchorItem.left
            right: scene.gameWindowAnchorItem.right
            topMargin: 30
            leftMargin: 30
            rightMargin: 30
        }

        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
    }

    MenuButton {
        id: startGameButton

        text: "Start Game!"
        width: 280
        height: 60
        pixelSize: 24

        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            top: highscoreText.bottom
            topMargin: 60
        }
    }
}
