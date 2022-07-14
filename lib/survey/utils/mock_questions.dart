import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/utils/question_type.dart';

final survey = SurveyHolder(questions: questionsList, points: 20);

final questionsList = [
  Question(
      question: '¿Pregunta uno?',
      url:
          'https://images.pexels.com/photos/3910071/pexels-photo-3910071.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      type: QuestionType.FACES),
  Question(
      question: '¿Pregunta dos?',
      url:
          'https://images.pexels.com/photos/3801990/pexels-photo-3801990.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      type: QuestionType.RADIO,
      answerList: {
        0: 'Opcion Uno',
        1: 'Opcion Dos',
        2: 'Opcion Tres',
      }),
  Question(
      question: '¿Pregunta tres?',
      url:
          'https://images.pexels.com/photos/3612182/pexels-photo-3612182.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      type: QuestionType.STAR,
      answerList: {
        0: 'Empaque',
        1: 'Color',
        2: 'Sabor',
      }),
  Question(
      question: '¿Pregunta cuatro?',
      url:
          'https://images.pexels.com/photos/4041392/pexels-photo-4041392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      type: QuestionType.LIKES),
  Question(
      question: '¿Pregunta cinco?',
      url:
          'https://images.pexels.com/photos/3819969/pexels-photo-3819969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      answerList: {
        0: 'Opcion Uno',
        1: 'Opcion Dos',
        2: 'Opcion Tres',
      },
      type: QuestionType.SELECTION),
  Question(
      question: '¿Pregunta seis?',
      url:
          'https://images.pexels.com/photos/3819969/pexels-photo-3819969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      answerList: {
        0: 'Opcion Uno',
        1: 'Opcion Dos',
        2: 'Opcion Tres',
      },
      type: QuestionType.OPEN),
];
