import 'quiz.dart';
import 'dart:io';
import 'questionPrint.dart';

main() async {
  print("\n\n\n\t\t**********Quiz**********");
  print("How many question would you like in the quiz?");
  print("If an invalid input is detected 5 questions will be selected!");
  Quiz quiz = new Quiz();

  var numQuestions = stdin.readLineSync();
  await quiz.buildQuiz(numQuestions);

  var len = quiz.numQuestions;

  print("\n$len questions were selected!\n");

  var i = 0;
  var status = 1;

  while (status > 0) {
    new QPrinter().printQ(quiz.pool[i], i + 1);
    quiz.pool[i].userAns = stdin.readLineSync();

    var ans = quiz.pool[i].ansChecker();

    if (ans == 1) {
      quiz.updateGrade(i, 1);
    }
    if (ans == 0) {
      quiz.updateGrade(i, 0);
      // print("Nope!");
      // print("You entered: ${quiz.pool[i].userAns}");
      // print("The correct answer was: ${quiz.pool[i].aAns}");
    } else {
      print("Invalid input try again!");
    }

    print("\nAnswer Submitted\nPrevious [P], Next [N], Quit [Q]");

    var response = "";
    response = stdin.readLineSync()!;

    if (response.toLowerCase() == "q") {
      status = -1;
    } else if (response.toLowerCase() == "p") {
      if (i != 0) {
        i -= 1;
      }
    } else if (response.toLowerCase() == "n") {
      i += 1;
    }

    if (i == len) {
      i = 0;
    }
  }

  print("\nScore: ${quiz.overallGrade()}");
}
