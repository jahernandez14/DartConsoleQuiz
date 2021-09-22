import 'question.dart';
import 'server.dart';

class Quiz {
  var _qPool = [];

  buildQuiz() async {
    Server server = new Server();
    var arr = await server.connectToServer();

    var len = arr.length;
    for (var i = 0; i < len; i++) {
      if (arr[i]["type"] == 1) {
        _qPool.add(
            new Question(arr[i]["answer"], arr[i]["stem"], arr[i]["option"]));
      } else {
        _qPool.add(new FillInQuestion(arr[i]["answer"], arr[i]["stem"], []));
      }
    }
  }

  List get pool {
    return this._qPool;
  }
}
