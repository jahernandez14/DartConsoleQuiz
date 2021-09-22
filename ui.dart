import 'quiz.dart';
import 'dart:io';

main() async {
  Quiz quiz = new Quiz();
  await quiz.buildQuiz();

  print("**********Quiz**********");

  var len = quiz.pool.length;
  var i = 0;
  while (i < len) {
    print("\nQuestion ${i + 1}: ${quiz.pool[i].ques}\n");
    var len = quiz.pool[i].choices.length;
    for (var j = 0; j < len; j++) {
      print("${j + 1}) ${quiz.pool[i].choices[j]}");
    }
    quiz.pool[i].userAns = stdin.readLineSync();
    var ans = quiz.pool[i].ansChecker();

    if (ans == 1) {
      print("Correct!");
      i += 1;
    } else if (ans == 0) {
      print("Nope!");
      print("You entered: ${quiz.pool[i].userAns}");
      print("The correct answer was: ${quiz.pool[i].aAns}");
      i += 1;
    } else {
      print("Invalid input try again!");
    }
  }
}
