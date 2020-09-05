import Felgo 3.0
import QtQuick 2.0

Item {
  id: audioManager

  // Use Sound IDs to play Sounds e.g. audioManager.play(audioManager.idDIE)
  property int idClick: 11
  property int idCorrectAnswer: 22
  property int idWrongAnswer: 33


  function play(clipID) {

    switch(clipID) {
    case idCorrectAnswer:
      correctAnswer.play()
      break
    case idWrongAnswer:
      wrongAnswer.play()
      break
    case idClick:
      click.play()
      break
    }
  }

  SoundEffect {
    id: click
    source: "../../assets/audio/click.wav"
  }

  SoundEffect {
    id: correctAnswer
    source: "../../assets/audio/correctAnswer1.wav"
  }

  SoundEffect {
    id: wrongAnswer
    source: "../../assets/audio/wrongAnswer1.wav"
  }
}
