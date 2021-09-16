import 'question.dart';

class Quiz {
  var _qPool = [];

  buildQuiz() {
    var len = questions.length;
    for (var i = 0; i < len; i++) {
      var dataLen = questions[i].length;
      if (dataLen < 3) {
        _qPool.add(new FillInQuestion(questions[i][0], questions[i][1], []));
      } else {
        _qPool.add(
            new Question(questions[i][0], questions[i][1], questions[i][2]));
      }
    }
  }

  List get pool {
    return this._qPool;
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
      "A) Blue",
      "What color is the sky? (A, B, C, or D)",
      ["A)Blue", "B)Green", "C)Red", "D)Yellow"]
    ],
    ["Sky", "The _____ is blue."]
  ];
}
