import Felgo 3.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    // This resolution is for iPhone 4 & iPhone 4S
    screenWidth: 640
    screenHeight: 960

    LoadingScene {
        id: loadingScene
    }

    activeScene: loadingScene

    // Show the loading scene as soon as the GameWindow is ready
    Component.onCompleted: {
        loadingScene.opacity = 1
        mainItemDelay.start()
    }

    // Start with the loading of all game components when the fade-in animation of the loading scene was fully displayed
    Timer {
        id: mainItemDelay
        interval: 1000
        onTriggered: {
            mainItemLoader.source = "MainItem.qml"
        }
    }

    // As soon as we set the source property, the loader will load the game
    Loader {
        id: mainItemLoader
        onLoaded: {
            if(item) {
                hideLoadingSceneDelay.start()
            }
        }
    }

    // Then give the game a time to fully display before hiding the loading scene, just to be sure it looks smooth also on low-end devices
    Timer {
        id: hideLoadingSceneDelay
        interval: 200
        onTriggered: {
            loadingScene.opacity = 0
        }
    }
}
