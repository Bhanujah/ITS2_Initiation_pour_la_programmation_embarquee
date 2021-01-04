import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'question.dart';
import 'Listquestion.dart';
ToutesQuestions toutesQuestions = ToutesQuestions();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor:Colors.grey.shade900,
        body:SafeArea(
          child:Padding(
            padding:EdgeInsets.symmetric(horizontal:10.0),
            child:QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();

}

class _QuizPageState extends State<QuizPage> {
  List<Icon> points = [];
  void verifier(bool userReponse) {
    setState(() {
      bool bonneReponse = toutesQuestions.getQuestionReponse();
      if (toutesQuestions.isFinished()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "FIN DU QUIZZ",
          desc:
          "Appuyez sur le bouton reset ci-dessous pour recommencer à jouer",
          buttons: [
            DialogButton(
              child: Text(
                "Reset Quiz",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                toutesQuestions.reset();
                points = [];
                Navigator.pop(context);
              },
              width: 120,
            )
          ],
        ).show();
      }
      if (userReponse == bonneReponse) {
        points.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        points.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      toutesQuestions.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget>[
        Expanded(
          flex:5,
          child:Padding(
            padding:EdgeInsets.all(10.0),
              child:Center(
                child:Text(
              toutesQuestions.getQuestionTexte(),
              textAlign:TextAlign.center,
              style:TextStyle(
                fontSize:25.0,
                color:Colors.white,
              ),
          ),
    ),
    ),
    ),
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(15.0),
            child:FlatButton(
              textColor: Colors.white,
              color:Colors.green,
              child:Text(
                'True',
                style:TextStyle(
                  color:Colors.white,
                  fontSize:20.0,

                ),
              ),
              onPressed:(){
                verifier(true);
                toutesQuestions.isFinished();
              },
            ),
          ),
        ),
        Expanded(
          child:Padding(
            padding:EdgeInsets.all(15.0),
            child:FlatButton(
              color:Colors.red,
              child:Text(
                'False',
                style:TextStyle(
                  fontSize:20.0,
                  color:Colors.white,

                ),
              ),
              onPressed: () {
                verifier(false);
                toutesQuestions.isFinished();
              },
            ),
          ),
        ),
        //TODO:Add a Row here as your score keeper
    ],
    );
  }
}
