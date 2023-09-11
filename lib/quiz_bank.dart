import 'package:ekhtibar_app/questios.dart';

class QuizBank {
  int _questiosNumber = 0;
  final List<Question> _questionBank = [
    Question(
      'The number of planets in the solar system is eight planets!',
      'images/image-1.jpg',
      true,
    ),
    Question(
      'Cats are carnivores!',
      'images/image-2.jpg',
      true,
    ),
    Question(
      'China is in Africa!',
      'images/image-3.jpg',
      false,
    ),
    Question(
      'Earth is flat spherical!',
      'images/image-4.jpg',
      false,
    ),
    Question(
      'Can a person survive without eating meat!',
      'images/image-5.jpg',
      true,
    ),
    Question(
      'The sun revolves around the earth and the earth revolves around the moon!',
      'images/image-6.jpg',
      false,
    ),
    Question(
      'Animals do not feel pain!',
      'images/image-7.jpg',
      false,
    ),
  ];

  void nextQuestion() {
    if (_questiosNumber < _questionBank.length - 1) {
      _questiosNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questiosNumber].questionText;
  }

  String getImage() {
    return _questionBank[_questiosNumber].image;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questiosNumber].answerText;
  }

  bool isFinished() {
    if (_questiosNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resat() {
    _questiosNumber = 0;
  }
}
