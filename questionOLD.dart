import 'dart:math';

class Question {
  var uAns;
  var _aAns;
  var _ques;
  var _choices;

  newQues() {
    var rng = new Random().nextInt(4);
    this._aAns = questions[rng][0];
    this._ques = questions[rng][1];
    this._choices = questions[rng][2];
  }

  set userAns(uAns) {
    this.uAns = uAns;
  }

  String get ques {
    return this._ques;
  }

  String get aAns {
    return this._aAns;
  }

  String get userAns {
    return this.uAns;
  }

  List get choices {
    return this._choices;
  }

  var questions = [
    [
      "True",
      "The sky is blue? (True or False)",
      ["True", "False"]
    ],
    [
      "False",
      "The sky is green? (True or False)",
      ["True", "False"]
    ],
    [
      "A",
      "What color is the sky? (A, B, C, or D)",
      ["A)Blue", "B)Green", "C)Red", "D)Yellow"]
    ],
    ["Sky", "The _____ is blue.", []]
  ];
}
