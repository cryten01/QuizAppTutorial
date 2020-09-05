import QtQuick 2.0
import Felgo 3.0

Item {
    id: manager

    property int nrOfCorrectAnswers: 0
    property int currentRound: 0
    property var questionDataPool: null

    Component.onCompleted: {
        // Parse JSON file that contains the question data
        loadQuestionDataFromJSON("../../assets/json/QuestionData.json", questionDataPool)
    }


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


    function startGame() {
        // Reset player values
        nrOfCorrectAnswers = 0
        currentRound = 0

        // Shuffle questions and their order
        shuffleArray(questionDataPool)
    }


    function shuffleArray(arrayToShuffle) {
        // The temporary container that is used for swapping
        var temp;

        // arrayToShuffle.length - 1 because indices go from 0 to n-1
        // >= 0 because we want to swap the first element with the second one as well
        for (var index = arrayToShuffle.length - 1; index > 0; index--) {

            // Floor because we only want full indices
            var randomIndex = Math.floor(Math.random() * index)

            // Swap elements at indices
            temp = arrayToShuffle[index];
            arrayToShuffle[index] = arrayToShuffle[randomIndex];
            arrayToShuffle[randomIndex] = temp;
        }
    }
}
