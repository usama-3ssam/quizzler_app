class Question {
  dynamic questionText;
  dynamic answerText;
  dynamic image;

  Question(String? q, String i, bool? a) {
    questionText = q;
    image = i;
    answerText = a;
  }
}
