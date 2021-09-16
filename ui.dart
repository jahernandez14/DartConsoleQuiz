import 'quiz.dart';
import 'dart:io';

main() {
  print("Quiz");
  Quiz quiz = new Quiz();
  quiz.buildQuiz();
  var len = quiz.pool.length;
  var i = 0;
  while (i < len) {
    print(quiz.pool[i].ques);
    var len = quiz.pool[i].choices.length;
    for (var j = 0; j < len; j++) {
      print(quiz.pool[i].choices[j]);
    }
    quiz.pool[i].userAns = stdin.readLineSync();

    if (quiz.pool[i].ansChecker()) {
      print("Correct!");
    } else {
      print("Nope!");
      print("You entered: ${quiz.pool[i].userAns}");
      print("The correct answer was: ${quiz.pool[i].aAns}");
    }
    print("\n");
    i += 1;
  }
}
