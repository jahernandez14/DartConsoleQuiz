import 'quiz.dart';
import 'dart:io';
import 'questionPrint.dart';

main() async {
  print("\n\n\n\t\t**********Quiz**********");
  print("How many question would you like in the quiz?");
  print("If an invalid input is detected 5 questions will be selected!\n");
  Quiz quiz = new Quiz();

  var numQuestions = stdin.readLineSync();
  await quiz.buildQuiz(numQuestions);

  var len = quiz.numQuestions;
  var i = 0;
  var status = true;

  while (i < len) {
    new QPrinter().printQ(quiz.pool[i], i + 1);
    quiz.pool[i].userAns = stdin.readLineSync();

    var ans = quiz.pool[i].ansChecker();

    if (ans == 1) {
      quiz.updateGrade(i, 1);
      i += 1;
    } else if (ans == 0) {
      quiz.updateGrade(i, 0);
      // print("Nope!");
      // print("You entered: ${quiz.pool[i].userAns}");
      // print("The correct answer was: ${quiz.pool[i].aAns}");
      i += 1;
    } else {
      print("Invalid input try again!");
    }
  }

  print("Score: ${quiz.overallGrade()}");
}
