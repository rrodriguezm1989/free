class Question {
  final String question;
  final String url;
  final Map<int, String>? answerList;
  dynamic ans;

  Question(
      {this.answerList, required this.question, required this.url, this.ans});
}

enum AnswerFace { smiley, yawn, sad }
