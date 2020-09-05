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

    MenuScene {
        id: menuScene
    }

    activeScene: menuScene

    // Show the loading scene as soon as the GameWindow is ready
    Component.onCompleted: {
        menuScene.opacity = 1
    }
}
