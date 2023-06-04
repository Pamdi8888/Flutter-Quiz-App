import 'package:flutter/material.dart';
import 'package:quiz_app/splash.dart';
import 'package:quiz_app/welcome.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    routes: {
      '/splash': (context) => Splash(),
      '/welcome': (context) => Welcome(),
      '/quiz': (context) => Quiz(),
    },
  ));
}