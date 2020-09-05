import QtQuick 2.0
import Felgo 3.0

Item {
    id: manager

    state: "menu"

    // state machine, takes care reversing the PropertyChanges when       changing the state, like changing the opacity back to its default state (= 0)
    states: [
        State {
            name: "loading"
            PropertyChanges {target: loadingScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: loadingScene}
        },
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]

    function setState(state) {
        manager.state = state;
    }
}
