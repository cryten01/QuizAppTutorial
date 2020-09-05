import QtQuick 2.0
import Felgo 3.0

Item {
    id: manager

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
                target = JSON.parse(dataString);

                // For testing purposes only!
                console.log(target)
            }
        }

        // False makes get request synchronous and ensures json data is ready when used
        xhr.open("GET", Qt.resolvedUrl(source), false);
        xhr.send(null);
    }
}
