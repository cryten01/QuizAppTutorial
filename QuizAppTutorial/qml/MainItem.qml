import QtQuick 2.0
import Felgo 3.0
import "scenes"
import "managers"
import "ui"

Item {
    id: mainItem

    Palette {
        id: palette
    }

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
    }

    AudioManager {
        id: audioManager
    }
}
