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
        font.pixelSize: 24
        width: 60

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
            onClicked: {
                state = "checkedIn"
                startCheckAnswers()
            }
        }
        AnswerButton {
            id: answerButton2
            text: "Answer 2"
            onClicked: {
                state = "checkedIn"
                startCheckAnswers()
            }
        }
        AnswerButton {
            id: answerButton3
            text: "Answer 3"
            onClicked: {
                state = "checkedIn"
                startCheckAnswers()
            }
        }
        AnswerButton {
            id: answerButton4
            text: "Answer 4"
            onClicked: {
                state = "checkedIn"
                startCheckAnswers()
            }
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

    function setAnswerButtonsActive(isEnabled) {
        answerButton1.enabled = isEnabled
        answerButton2.enabled = isEnabled
        answerButton3.enabled = isEnabled
        answerButton4.enabled = isEnabled
    }


    Timer {
        id: showResultsDelay
        interval: 500
        running: false
        repeat: false

        onTriggered: {
            checkAndShowResult(answerButton1)
            checkAndShowResult(answerButton2)
            checkAndShowResult(answerButton3)
            checkAndShowResult(answerButton4)

            gameManager.stopCurrentRound()
        }
    }

    function startCheckAnswers() {
        // First lock all buttons so that no new user input is possible
        setAnswerButtonsActive(false)

        // Then after 2 seconds we check each button if it is correct and was clicked
        showResultsDelay.start()
    }

    function checkAndShowResult(button) {
        var isAnswerCorrect = gameManager.checkAnswer(button.text)

        if (isAnswerCorrect) {
            if (button.state === "checkedIn") {
                gameManager.increaseCorrectAnswers()
                audioManager.play(audioManager.idCorrectAnswer)
            }

            button.setState("correctAnswer")
        }

        if (!isAnswerCorrect && button.state === "checkedIn") {
            button.setState("wrongAnswer")
            audioManager.play(audioManager.idWrongAnswer)
        }
    }
}
