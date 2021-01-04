import 'question.dart';
//questionBank became tenquestions
//questionNumber became questionNumero
class ToutesQuestions {
  int _questionNumero = 0;

  List<Question> _questionList = [
    Question('La vie est dure.', true),
    Question('Le contrôle de M.ABREU était facile.', false),
    Question('ESIPE est une école d\'ingénieur devenue EPISEN ', true),
    Question('Tu es gentil(le).', true),
    Question('Les partiels durent en général 1h.', false),
    Question('La vie étudiante est la meilleure.', false),
    Question('Il ne faut jamais croire personne à 100%', true),
    Question('Les enseignants à l\'EPISEN sont très patient.', true),
    Question('Le christianisme est une religion polythéiste.', false),
    Question('Les femmes sont plus fortes, sincères et intelligentes.', true),
  ];

  void nextQuestion() {
    if (_questionNumero < _questionList.length - 1) {
      _questionNumero++;
    }
  }

  String getQuestionTexte() {
    return _questionList[_questionNumero].questionTexte;
  }

  bool getQuestionReponse() {
    return _questionList[_questionNumero].questionReponse;
  }

  bool isFinished() {
    if (_questionNumero == _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumero = 0;
  }
}