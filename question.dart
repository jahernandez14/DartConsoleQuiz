import 'dart:math';

class Question {
  var uAns;
  var _aAns;
  var _ques;
  var _choices;

  newQues() {
    var rng = new Random().nextInt(3);
    this._aAns = questions[rng];
    print(_aAns);
  }

  // printQuestion() {
  //   print(ques);
  //   var uAns = stdin.readLineSync();

  //   if (uAns == aAns) {
  //     print("Correct!");
  //   } else {
  //     print("Nope!");
  //   }
  // }

  var questions = [
    "True",
    "The sky is blue? (True or False)",
    ["True", "False"],
    [
      "False",
      "The sky is green? (True or False)",
      ["True", "False"]
    ],
    [
      "A",
      "What color is the sky?",
      ["A)Blue", "B)Green", "C)Red", "D)Yellow"]
    ]
  ];
}
