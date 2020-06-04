import 'package:flutter/material.dart';

import 'data/Quizz.dart';

class QuizzBrain {
  List<Quizz> quizzList = [
    Quizz(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Quizz(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Quizz(q: 'A slug\'s blood is green.', a: true)
  ];
  int currentPosition = 0;
  int correctAwnser = 0;
  List<Icon> scoreKeeper = [];
  String setQuestion() {
    if (currentPosition <= quizzList.length - 1) {
      return quizzList[currentPosition].question;
    } else {
      return quizzList[0].question;
    }
  }

  void getAwnser(bool itemAwnser, bool optionClicked) {
    if (optionClicked && itemAwnser) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      correctAwnser++;
    } else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  void play(bool optionClicked) {
    if (currentPosition <= quizzList.length - 1) {
      getAwnser(quizzList[currentPosition].awnser, optionClicked);
      currentPosition++;
    } else {
      currentPosition = 0;
      scoreKeeper = [];
      correctAwnser = 0;
    }
  }
}
