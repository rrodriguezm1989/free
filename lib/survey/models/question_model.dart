import 'package:dandy/survey/utils/question_type.dart';

class Question {
  final String question;
  final String url;
  final Map<int, String>? answerList;
  final QuestionType type;
  dynamic ans;

  Question(
      {this.answerList, required this.question, required this.url, this.ans,
      required this.type
      });
}

enum AnswerFace { smiley, yawn, sad }
