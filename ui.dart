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

    try{
      quiz.pool[i].userAns = int.parse(stdin.readLineSync()!);
    }
    catch (u){
    }

    var ans = quiz.pool[i].ansChecker();
    if (ans == 1 ) {
      print("Correct!");
      i += 1;
    } 
    else if (ans == 0) {
      print("Nope!");
      print("You entered: ${quiz.pool[i].userAns}");
      print("The correct answer was: ${quiz.pool[i].aAns}");
      i += 1;
    }
    else{
      print("Invalid input try again!");
    }
  }
}
