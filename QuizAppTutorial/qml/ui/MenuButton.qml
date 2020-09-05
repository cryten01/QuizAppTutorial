import QtQuick 2.0
import Felgo 3.0

ButtonBase {
    id: button

    onPressed: {
        color = pressedColor
    }

    onReleased: {
        color = defaultColor
    }
}
