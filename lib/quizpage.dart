import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizzBrain quizzBrain = QuizzBrain();

  checkAndShowAlertDialog(BuildContext context) {
    Widget continueButton = FlatButton(
      child: Text('Play again'),
      onPressed: () => Navigator.pop(context),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Game over!'),
      content:
          Text('You awnsered ${quizzBrain.correctAwnser}/3 question correctly'),
      actions: [
        continueButton,
      ],
      elevation: 24.0,
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(),
    );

    if (quizzBrain.currentPosition > quizzBrain.quizzList.length - 1) {
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  void setStatePlay(bool option) {
    setState(() {
      quizzBrain.play(option);
      checkAndShowAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.setQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setStatePlay(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setStatePlay(false);
              },
            ),
          ),
        ),
        Row(
          children: quizzBrain.scoreKeeper,
        )
      ],
    );
  }
}
