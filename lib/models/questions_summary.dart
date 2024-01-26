import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: data['userAns'] == data['correctAns']
                          ? const Color.fromARGB(255, 116, 89, 255)
                          : const Color.fromARGB(255, 185, 112, 245)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question']).toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        data['userAns'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 185, 112, 245),
                            fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        data['correctAns'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 116, 89, 255),
                            fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
