import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/pages/questions_screen.dart';
import 'package:quizapp/pages/splashscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];

  String activeScreen = "1";

  void switchScreen() {
    setState(() {
      activeScreen = "2";
    });
  }

  void chooseAnswer(String Answer) {
    selectedAnswer.add(Answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "1";
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 21, 149),
      body: activeScreen == "1"
          ? SplashScreen(switchScreen)
          : QuestionsScreen(
              chooseAnswer: chooseAnswer,
            ),
    ));
  }
}
