import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/data/questions.dart';

class ElevetedStyledButton extends StatelessWidget {
  void Function()? onPressed;
  final String text;

  ElevetedStyledButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 54, 3, 84),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
