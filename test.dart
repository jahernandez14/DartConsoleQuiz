import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  const _Query = 'quiz';
  var url = Uri.http(
      'www.cs.utep.edu', '/cheon/cs4381/homework/quiz', {_Query: "quiz01"});
  var response = await http.get(url);
  final query = response.body;
  print(query);
  var decoded = json.decode(query);
  print(decoded);
}
