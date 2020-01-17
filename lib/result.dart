import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // getter, doesn't use parentheses
  String get resultPhrase {
    var resultText;
    if (resultScore >= 20) {
      resultText = 'You are awesome!';
    } else if (resultScore >= 15) {
      resultText = 'Pretty amazing';
    } else if (resultScore >= 10) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Reset Quiz!'),
          onPressed: resetHandler,
          textColor: Colors.blue,
        )
      ]),
    );
  }
}
