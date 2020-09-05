import QtQuick 2.0
import Felgo 3.0

ButtonBase {
    id: button

    width: 280
    height: 60
    pixelSize: palette.textDefaultSize

    state: "default"

    states: [
        State {
            name: "default"
            PropertyChanges {target: button; color: palette.btnDefaultColor}
        },
        State {
            name: "checkedIn"
            PropertyChanges {target: button; color: palette.btnCheckedInColor}
        },
        State {
            name: "correctAnswer"
            PropertyChanges {target: button; color: palette.btnCorrectAnswerColor}
        },
        State {
            name: "wrongAnswer"
            PropertyChanges {target: button; color: palette.btnWrongAnswerColor}
        }
    ]

    function setState(state) {
        button.state = state;
    }
}
