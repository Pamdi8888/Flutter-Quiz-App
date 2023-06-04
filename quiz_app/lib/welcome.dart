import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      // appBar: AppBar(
      //   title: const Text("Welcome!"),
      // ),
      body: SafeArea(
          child: content()
      ),
    );
  }

  Widget content() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("Images/QuizImage.png"),
            ),
            Text(
              "Enter your name",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.grey[350],
                fontFamily: 'Vibes',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(),
                hintText: "Your Nickname",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {route();},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400]),
                child: Text(
                  'Take the quiz!',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  route() {
    // Navigator.pushNamed(context, '/quiz');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Quiz()));

  }
}
