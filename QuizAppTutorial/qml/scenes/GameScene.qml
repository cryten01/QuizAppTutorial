import QtQuick 2.0
import Felgo 3.0
import "../ui"

SceneBase {
    id: scene

    Rectangle {
        id: background
        color: "orange"

        anchors.fill: scene.gameWindowAnchorItem
    }

    CountDownBar {
        id: countDownBar

        anchors {
            top: scene.gameWindowAnchorItem.top
            left: scene.gameWindowAnchorItem.left
            right: scene.gameWindowAnchorItem.right
        }

        onTimeIsUp: {
            countDownBar.stopCountDown()
        }
    }

    Text {
        id: currentRoundText

        text: "Round 0 / 10"
        color: "white"
        font.pixelSize: 24

        anchors {
            top: countDownBar.bottom
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
        id: questionText

        text: "Is this a test question?"
        color: "white"
        font.pixelSize: 36

        anchors {
            top: currentRoundText.bottom
            left: scene.gameWindowAnchorItem.left
            right: scene.gameWindowAnchorItem.right
            topMargin: 30
            leftMargin: 30
            rightMargin: 30
        }

        wrapMode: Text.Wrap
        horizontalAlignment : Text.AlignHCenter
    }

    Column {
        id: answerColumn

        spacing: 10

        anchors {
            horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
            top: questionText.bottom
            topMargin: 30
        }

        AnswerButton {
            id: answerButton1
            text: "Answer 1"
        }
        AnswerButton {
            id: answerButton2
            text: "Answer 2"
        }
        AnswerButton {
            id: answerButton3
            text: "Answer 3"
        }
        AnswerButton {
            id: answerButton4
            text: "Answer 4"
        }
    }

    function setCurrentRoundText(currentRound) {
        currentRoundText.text = "Round " + currentRound + " / 10";
    }

    function setQuestion (question) {
        questionText.text = question;
    }

    function setAnswers (answers) {
        answerButton1.text = answers[0];
        answerButton2.text = answers[1];
        answerButton3.text = answers[2];
        answerButton4.text = answers[3];
    }

    function resetAnswerButtonStates() {
        answerButton1.setState("default");
        answerButton2.setState("default");
        answerButton3.setState("default");
        answerButton4.setState("default");
    }

    function restartCountDown() {
        countDownBar.restartCountDown()
    }
}
