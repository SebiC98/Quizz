import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

/*void main() {
  runApp(MyApp());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 6},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 9},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Cat', 'score': 10},
        {'text': 'Rat', 'score': 2}
      ]
    },
    {
      'questionText': 'What\s your favorite song?',
      'answers': [
        {'text': 'Susan', 'score': 10},
        {'text': 'Bella', 'score': 5},
        {'text': 'Manele', 'score': 9},
        {'text': 'Ozone', 'score': 6}
      ]
    }
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.orange,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
