import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: quizcontent()
      ),
    );
  }

  Widget quizcontent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Center(
        child: Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(40.0),
                //   child: Text(
                //     questions[0].text,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 30,
                //       color: Colors.grey[350],
                //     ),
                //   ),
                // ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final _question = questions[0];
                      return buildQuestion(_question);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 32,
      ),
      Text(
        question.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey[350],
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.grey[600],
      ),
      const SizedBox(
        height: 32,
      ),
      Expanded(
        child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
            }
          },
        ),
      ),
    ]);
  }
}

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({Key? key, required this.question, required this.onClickedOption}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: question.options.map((option) => buildOption(context, option)).toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: TextStyle(fontSize: 20, color: Colors.grey[350]),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question){
    final isSelected = option == question.selectedOption;
    if (question.isLocked){
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade400;
  }
}
