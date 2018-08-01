import 'package:flutter/material.dart';
import '../UI/answer_button.dart';
import '../util/question.dart';
import '../util/quiz.dart';
import '../UI/question_text.dart';
import '../UI/overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  
  Quiz quiz = new Quiz([
    new Question('Flutter is Awesome', true),
    new Question('MUJ is love', true),
    new Question('Coding Sucks Sometimes', false),
    new Question('Elicit will be LIT', true),
    new Question('All Faculties are Awesome', false),
    new Question('You will find the love of your life', false),
    new Question('This app is Great', true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;

  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);     //increments the score, it is defined in quiz.dart
    this.setState(() {
      overlayVisible = true;    //we need to now make the overlay visible as the answer has been given by the user
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          //this is our main page
          children: <Widget>[

            //we use Expanded property so that the widget inside this covers the entire screen
            //usually Flutter Widgets tend to occupy as much space as possible, but when inside the children property, they take up as less space as possible
            new AnswerButton(true, () => handleAnswer(true)),   //true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)), //false button
          ],
        ),
       overlayVisible == true ?  new CorrectWrongOverlay(
         isCorrect,
           (){

            if(quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
                  builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length )
              ), (Route route)=> route == null);
              return; //because we do not want to execute any code after we reach the score board
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){

              overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
           }
       ) : new Container(),
      ],

    );
  }
}


