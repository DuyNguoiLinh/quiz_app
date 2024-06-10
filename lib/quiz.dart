import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswer=[];
  var activeScreen= 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void chooseAnswer(String answer) {
      selectedAnswer.add(answer);
      if(selectedAnswer.length == questions.length){
        setState(() {
          activeScreen="results-screen";
        });
      }
  }
  void restart() {
    setState(() {
      selectedAnswer=[];
      activeScreen="question-screen";
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget= StartScreen(switchScreen);
    if(activeScreen=='question-screen') {
      screenWidget=QuestionScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen=='results-screen') {
      screenWidget= ResultsScreen(chooseAnswers: selectedAnswer, onRestart: restart );
    }

    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient:  LinearGradient(
                    colors: [
                      Color.fromARGB(255, 78, 13, 151),
                      Color.fromARGB(255, 107, 15, 168),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
              ),
              child: screenWidget,  )
          ),
        );
  }
}
