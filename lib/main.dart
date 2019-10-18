import 'package:first_app/answer.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'package:first_app/question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

//void main() {
//  runApp(MyApp()); //автоматически выполняется, когда запускаем приложение. Берет виджет и рисует
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//Каждый виджет расширяет либо StatelessWidget, либо StatefulWidget
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': "What's your favorite animal",
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Cow', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ]
    },
    {
      'questionText': "Who's your favorite friend",
      'answer': [
        {'text': 'Artem', 'score': 10},
        {'text': 'Artem', 'score': 5},
        {'text': 'Artem', 'score': 3},
        {'text': 'Artem', 'score': 1}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  /**
   * Не забывает что это надо делать в setState
   */
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"), //пытаемся поменять состояние
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
