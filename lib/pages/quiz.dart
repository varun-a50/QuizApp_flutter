import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/pages/questions_screen.dart';
import 'package:quizapp/pages/splashscreen.dart';
import 'package:quizapp/models/resultScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  String activeScreen = "Start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "Question-screen";
    });
  }

  void chooseAnswer(String Answer) {
    selectedAnswer.add(Answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "Result_screen";
      });
    }
  }

  void restartButton() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "Start-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = SplashScreen(switchScreen);

    if (activeScreen == 'Question-screen') {
      screenWidget = QuestionsScreen(chooseAnswer: chooseAnswer);
    }
    if (activeScreen == "Result_screen") {
      screenWidget = ResultScreen(
        result: selectedAnswer,
        restartButton: restartButton,
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 63, 21, 149),
          body: screenWidget,
        ));
  }
}
