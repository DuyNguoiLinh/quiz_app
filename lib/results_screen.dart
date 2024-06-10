import 'package:flutter/material.dart';
import 'package:quiz_app/widget/questions_summary.dart';
import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chooseAnswers, required this.onRestart});
  final List<String> chooseAnswers;
 final void Function()  onRestart;
  List<Map<String,Object>> getSummaryData() {
     final List<Map<String,Object>> summary = [];
     for(var i=0; i< chooseAnswers.length;i++){
       summary.add({
         'question_index':i,
         'question' : questions[i].text,
         'correct_answer' : questions[i].answer[0],
         'use_answer' : chooseAnswers[i],
       });
     }
     return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData= getSummaryData();
    final numTotalQuestion=questions.length;
    final numCorrectQuestions= summaryData.where((data) => data['use_answer'] == data['correct_answer']).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
        margin: const EdgeInsets.all(40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Your answered $numCorrectQuestions out of $numTotalQuestion questions correctly !',
           style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 20, ),
            textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30,),
        QuestionsSummary(summaryData),
        TextButton(
          onPressed: onRestart ,
            child: const Text('restart',
            style: TextStyle(color: Colors.white, fontSize: 25),
            ),
        )
      ],
    ),
    ),
    );
  }
}
