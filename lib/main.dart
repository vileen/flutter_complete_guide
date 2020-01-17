import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const = compile time constant
  // final = runtime constant
  // it's possible to use const to variable and to value
  // if it's used to variable, value is automatically treated as a const
  // if it's used only on a value and not on variable
  // the variable can be assigned to something different
  final _questions = const [
    // those are maps, shorthand notation for Map
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': "What's your favorite animal",
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 10}
      ]
    },
    {
      'questionText': "What's your favorite instructor",
      'answers': [
        {'text': 'Max', 'score': 2},
        {'text': 'Maz', 'score': 9},
        {'text': 'Maq', 'score': 10},
        {'text': 'Man', 'score': 5}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // setState is used to inform the app to rebuild because there will be a change

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
