import 'question.dart';
import 'server.dart';
import 'dart:math';

class Quiz {
  var _qPool = [];
  var _numQuestions;

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
      var rng = new Random().nextInt(poolLen);
      if (arr[i]["type"] == 1) {
        _qPool.add(new Question(arr[rng]["type"], arr[rng]["answer"],
            arr[rng]["stem"], arr[rng]["option"]));
      } else {
        _qPool.add(new FillInQuestion(
            arr[rng]["type"], arr[rng]["answer"], arr[rng]["stem"], []));
      }
    }
  }

  List get pool {
    return this._qPool;
  }

  int get numQuestions {
    return this._numQuestions;
  }
}
