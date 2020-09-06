import QtQuick 2.0
import Felgo 3.0
import "../scenes"

Item {
    id: manager

    property var questionDataPool: null
    property int currentRound: 0
    property int totalRounds: 10
    property int highScore: 0
    property int nrOfCorrectAnswers: 0
    property string currentCorrectAnswer: ""

    Component.onCompleted: {
        loadQuestionDataFromJSON("../../assets/json/QuestionData.json", questionDataPool)
    }

    function startGame() {
        // Reset player values
        nrOfCorrectAnswers = 0
        currentRound = 0

        shuffleArray(questionDataPool)
        startNewRound()
    }

    function startNewRound() {
        currentRound++;

        // Get question at position currentRound-1
        var questionObj = questionDataPool[currentRound-1]

        // Then store the question
        var question = questionObj.question

        // We also need the correct answer for later reference
        currentCorrectAnswer = questionObj.correctAnswer

        // Temporarily store the answers for shuffling
        var answers = [questionObj.correctAnswer,
                       questionObj.wrongAnswers[0],
                       questionObj.wrongAnswers[1],
                       questionObj.wrongAnswers[2]];

        // Then shuffle all the answers including the correct one
        shuffleArray(answers)

        // Send all relevant data to the game scene
        gameScene.setCurrentRoundText(currentRound)
        gameScene.setQuestionTexts(question)
        gameScene.setAnswerButtonTexts(answers)

        // Request preparing buttons
        gameScene.resetAnswerButtonStates();
        gameScene.setAnswerButtonsActive(true);

        // Now start the round by restarting the countdown!
        gameScene.restartCountDown()
    }

    Timer {
        id: stopCurrentRoundDelay
        interval: 1000
        running: false
        repeat: false

        onTriggered: {
            if (currentRound < totalRounds) {
                startNewRound()
            } else {
                endGame()
            }
        }
    }

    function stopCurrentRound() {
        stopCurrentRoundDelay.start()
    }

    function endGame() {
        // Check if new high score was reached
        if (nrOfCorrectAnswers > highScore)
        {
            highScore = nrOfCorrectAnswers;
            menuScene.updateHighscoreText(highScore);
        }

        // Notify the sceneManager so that he can switch the scene back to the menu scene
        sceneManager.setState("menu")
    }


    //////////////////////
    // Helper functions
    //////////////////////

    function loadQuestionDataFromJSON(source, target) {
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var dataString = xhr.responseText;
                questionDataPool = JSON.parse(dataString);
            }
        }

        // False makes get request synchronous and ensures json data is ready when used
        xhr.open("GET", Qt.resolvedUrl(source), false);
        xhr.send(null);
    }

    function shuffleArray(arrayToShuffle) {

        var temp;

        // arrayToShuffle.length - 1 because indices go from 0 to n-1
        for (var index = arrayToShuffle.length - 1; index > 0; index--) {

            // Floor because we only want full indices
            var randomIndex = Math.floor(Math.random() * index)

            // Swap elements at indices
            temp = arrayToShuffle[index];
            arrayToShuffle[index] = arrayToShuffle[randomIndex];
            arrayToShuffle[randomIndex] = temp;
        }
    }

    function checkAnswer(answer) {
        if (answer === currentCorrectAnswer) {
            return true;
        } else {
            return false;
        }
    }

    function increaseCorrectAnswers() {
        nrOfCorrectAnswers++;
    }
}
