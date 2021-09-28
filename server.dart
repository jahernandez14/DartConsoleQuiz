import 'package:http/http.dart' as http;
import 'dart:convert';

///Server class to establish a connection with the server, parse the json and return a future list of all of the questions.
class Server {
  var _quiz = [];

  Future<List> connectToServer() async {
    var url = Uri.http(
        'www.cs.utep.edu', '/cheon/cs4381/homework/quiz', {"quiz": "quiz01"});
    var response = await http.get(url);
    final query = response.body;

    var decoded = json.decode(query);

    var arr = decoded["quiz"]["question"];
    var len = arr.length;

    for (var j = 0; j < len; j++) {
      this._quiz.add(arr[j]);
    }
    return this._quiz;
  }
}
