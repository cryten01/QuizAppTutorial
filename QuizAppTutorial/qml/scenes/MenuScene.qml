import QtQuick 2.0
import Felgo 3.0
import "../ui"

SceneBase {
    id: scene

    signal startGameButtonClicked

    Rectangle {
        id: background
        color: palette.menuSceneBGColor

        anchors.fill: scene.gameWindowAnchorItem
    }

    Text {
        id: welcomeText

        text: "Welcome to Quiz App!"
        color: palette.textDefaultColor
        font.pixelSize: palette.textHighlightSize

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
        color: palette.textDefaultColor
        font.pixelSize: palette.textDefaultSize

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
        pixelSize: palette.textDefaultSize

        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            top: highscoreText.bottom
            topMargin: 60
        }

        onClicked: {
            sceneManager.setState("game")
            gameManager.startGame()
            audioManager.play(audioManager.idClick)
        }
    }

    function updateHighscoreText(highScore)
    {
        highscoreText.text = "Highscore: " + highScore + " / 10";
    }
}
