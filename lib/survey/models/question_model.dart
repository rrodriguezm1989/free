class Question {
  final String question;
  final String url;
  AnswerFace? ans;

  Question({required this.question, required this.url, this.ans});
}

enum AnswerFace { smiley, yawn, sad }
