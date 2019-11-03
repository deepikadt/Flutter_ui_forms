import 'package:flutter/material.dart';
import 'package:flutter_form/ui/recommandations.dart';

class QuizCompleted extends StatelessWidget 
{
  final int _totalScore;
  final Function resetQuiz;

  QuizCompleted(this._totalScore, this.resetQuiz);

  String get result {
    print(_totalScore);

    if (_totalScore < 50)
      return 'We will add more clothing in our collection.';
    else if (_totalScore < 100)
      return 'Thanks! hope you will get some picese.';
    else if (_totalScore < 150)
      return 'Woo! You got 20% off. buy now';
    else
      return 'You are invited to our exclusive store and get 40% off';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(result),
          FlatButton(
            child: Text('ResetQuiz'),
            onPressed: resetQuiz,
          ),
          FlatButton(
              child: Text('MoveToNext'),
              onPressed: () {
                //reset the quiz
               resetQuiz;

                //move to recommadations page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Recommandations()));
              }),
        ],
      ),
    );
  }
}
