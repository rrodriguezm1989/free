import 'package:dandy/survey/utils/question_type.dart';

class SurveyHolder {
  final List<Question> questions;
  final int points;

  SurveyHolder({required this.questions, required this.points});
}

class Question {
  final String question;
  final String url;
  final Map<int, String>? answerList;
  final QuestionType type;
  //The question's type can change depending on the type of question
  dynamic ans;
  Function? validate;

  Question(
      {this.answerList,
      required this.question,
      required this.url,
      this.ans,
      required this.type});
}

enum AnswerFace { smiley, yawn, sad }
