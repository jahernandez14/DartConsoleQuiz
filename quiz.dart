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
      "1",
      "What color is the sky? (1, 2, 3, or 4)",
      ["1)Blue", "2)Green", "3)Red", "4)Yellow"]
    ]
  ];
}
