import QtQuick 2.0
import Felgo 3.0

Item {
    id: countDownBar

    signal timeIsUp

    Rectangle {
        id: backgroundBar
        color: "grey"
        height: 20
        width: parent.width

        Rectangle {
            id: progressBar
            color: "white"
            width: parent.width
            height: parent.height
        }
    }

    Timer {
        id: tickTimer
        interval: 10    // Run the timer every 10ms
        running: false  // We need to activate it
        repeat: true    // Repeat it

        onTriggered: {
            if (progressBar.width > 0) {
                // Decrease the progress bar width each tick
                progressBar.width -= backgroundBar.width / 1000
            } else {
                // Emit a signal event that the time is up
                timeIsUp()
            }
        }
    }

    function restartCountDown() {
        progressBar.width = backgroundBar.width
        tickTimer.restart();
    }

    function stopCountDown() {
        tickTimer.stop();
    }
}
