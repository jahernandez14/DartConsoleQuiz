import 'question.dart';

main() {
  print("Quiz");
  var i = 0;
  while (i < 3) {
    Question().newQues();
    i += 1;
  }
}
