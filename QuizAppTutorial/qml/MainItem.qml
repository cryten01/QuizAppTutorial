import QtQuick 2.0
import Felgo 3.0
import "scenes"
import "managers"

Item {
    id: mainItem

    MenuScene {
        id: menuScene
    }

    GameScene {
        id: gameScene
    }

    SceneManager {
        id: sceneManager
    }

    GameManager {
        id: gameManager

        onGameHasEnded: {
            sceneManager.setState("menu")
        }
    }

    AudioManager {
        id: audioManager
    }
}
