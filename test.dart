import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  const _Query = 'quiz';
  var url = Uri.http(
      'www.cs.utep.edu', '/cheon/cs4381/homework/quiz', {_Query: "quiz01"});
  var response = await http.get(url);
  final query = response.body;

  var decoded = json.decode(query);

  var arr = decoded["quiz"]["question"];
  var quiz = [];
  var len = arr.length;

  for (var j = 0; j < len; j++) {
    quiz.add(arr[j]);
  }

  print(quiz);
}
