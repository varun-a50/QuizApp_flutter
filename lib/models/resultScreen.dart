import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/models/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> result;

  ResultScreen({required this.result, required this.restartButton, super.key});

  void Function()? restartButton;

  List<Map<String, Object>> getSummuryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < result.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correctAns': questions[i].answers[0],
        'userAns': result[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getSummuryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summarydata.where(
      (data) {
        return data['userAns'] == data['correctAns'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $numCorrectQuestions out of $numTotalQuestions qustions correctly!',
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 185, 112, 245),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restartButton,
              icon: const Icon(
                Icons.refresh_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
