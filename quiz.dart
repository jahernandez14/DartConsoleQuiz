import 'question.dart';
import 'server.dart';
import 'dart:math';

class Quiz {
  var _qPool = [];
  var _numQuestions;
  var _grade = [];

  buildQuiz(num) async {
    try {
      _numQuestions = int.parse(num);
    } catch (u) {
      print("\nInvalid Quiz Length A Default Length of 5 Was Selected");
      _numQuestions = 5;
    }

    Server server = new Server();
    var arr = await server.connectToServer();
    var poolLen = arr.length;
    for (var i = 0; i < this._numQuestions; i++) {
      _grade.add(0);
      var rng = new Random().nextInt(poolLen);
      if (arr[rng]["type"] == 1) {
        _qPool.add(new Question(arr[rng]["type"], arr[rng]["answer"],
            arr[rng]["stem"], arr[rng]["option"]));
      } else {
        _qPool.add(new FillInQuestion(
            arr[rng]["type"], arr[rng]["answer"], arr[rng]["stem"], []));
      }
    }
  }

  int getGrade(i) {
    return _grade[i];
  }

  String overallGrade() {
    var total;
    for (var i = 0; i < this._numQuestions; i++) {
      if (_grade[i] == 1) {
        total = 1;
      }
    }
    return "$total/$_numQuestions";
  }

  void updateGrade(index, score) {
    this._grade[index] = score;
  }

  List get pool {
    return this._qPool;
  }

  int get numQuestions {
    return this._numQuestions;
  }
}
