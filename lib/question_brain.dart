import 'package:flutter/material.dart';

import 'data/Quizz.dart';

class QuizzBrain {
  List<Quizz> _quizzList = [
    Quizz(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Quizz(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Quizz(q: 'A slug\'s blood is green.', a: true)
  ];
  int _currentPosition = 0;
  int _correctAnswer = 0;
  List<Icon> scoreKeeper = [];

  String setQuestion() {
    if (_currentPosition <= _quizzList.length - 1) {
      return _quizzList[_currentPosition].question;
    } else {
      return _quizzList[0].question;
    }
  }

  void getAnswer(bool itemAwnser, bool optionClicked) {
    if (optionClicked && itemAwnser) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      _correctAnswer++;
    } else if (optionClicked == false && itemAwnser == false) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      _correctAnswer++;
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void play(bool optionClicked) {
    if (_currentPosition <= _quizzList.length - 1) {
      getAnswer(_quizzList[_currentPosition].answer, optionClicked);
      _currentPosition++;
    } else {
      _currentPosition = 0;
      scoreKeeper = [];
      _correctAnswer = 0;
    }
  }

  void reloadGame() {
    _currentPosition = 0;
    scoreKeeper = [];
    _correctAnswer = 0;
  }

  int getListSize() => _quizzList.length - 1;
  int getCorrectAnswers() => _correctAnswer;
  int getCurrentPosition() => _currentPosition;
}
