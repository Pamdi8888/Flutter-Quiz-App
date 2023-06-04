import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(milliseconds: 4000);
    return Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacementNamed(context, '/welcome');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: content()
      ),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        child: Lottie.asset('animations/bulb_animation.json',
            height: 300, repeat: true, reverse: true, fit: BoxFit.cover),
      ),
    );
  }
}
