class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffedanswer() {
    final finallist = List.of(answers);
    finallist.shuffle();
    return finallist;
  }
}
