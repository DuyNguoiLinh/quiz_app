import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: const Quiz()),
        ));
  }
}
