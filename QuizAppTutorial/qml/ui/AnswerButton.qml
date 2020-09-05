import QtQuick 2.0
import Felgo 3.0

ButtonBase {
    id: button

    width: 280
    height: 60
    pixelSize: 24

    state: "default"

    states: [
        State {
            name: "default"
            PropertyChanges {target: button; color: "grey"}
        },
        State {
            name: "checkedIn"
            PropertyChanges {target: button; color: "yellow"}
        },
        State {
            name: "correctAnswer"
            PropertyChanges {target: button; color: "green"}
        },
        State {
            name: "wrongAnswer"
            PropertyChanges {target: button; color: "red"}
        }
    ]

    function setState(state) {
        button.state = state;
    }
}
