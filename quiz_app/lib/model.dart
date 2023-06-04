class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
    });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    text: "Who invented the automobile?",
    options: [
      const Option(text: "Karl Benz", isCorrect: true),
      const Option(text: "Henry Ford", isCorrect: false),
      const Option(text: "Alexander Winton", isCorrect: false),
      const Option(text: "Enzo Ferrari", isCorrect: false),
    ],
  ),
];