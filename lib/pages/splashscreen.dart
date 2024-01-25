import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  void Function()? onPressed;
  SplashScreen(this.onPressed, {super.key});

  @override
  Widget build(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Learn Flutter the fun way",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              backgroundColor: const Color.fromARGB(255, 63, 21, 149),
              onPressed: onPressed,
              label: const Text("Start Quiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
