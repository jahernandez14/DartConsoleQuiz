import 'quiz.dart';
import 'dart:io';
import 'questionPrint.dart';

///main program UI
main() async {
  print("\n\n\n\t\t**********Quiz**********");
  print("How many question would you like in the quiz?");
  print("If an invalid input is detected 5 questions will be selected!");
  Quiz quiz = new Quiz();

  //retriever user response for the number of questions
  var numQuestions = stdin.readLineSync();
  await quiz.buildQuiz(numQuestions);

  var len = quiz.numQuestions;

  print("\n$len question(s) were selected!\n");

  var i = 0;
  var status = 1;

  //while loop that runs the questions continously
  while (status > 0) {
    new QPrinter().printQ(quiz.pool[i], i + 1);
    quiz.pool[i].userAns = stdin.readLineSync();

    var ans = quiz.pool[i].ansChecker();

    //if statement to check if the question was answered correctly
    if (ans == 1) {
      quiz.updateGrade(i, 1);
    } else if (ans == 0) {
      quiz.updateGrade(i, 0);
    } else {
      print("Invalid answer choice!");
    }

    //print statement to let the user know when the quiz has been completed.
    if (i == len - 1) {
      print(
          "\nThe end of the quiz has been reached.\nIf you press N you will start from the start of the quiz");
    }

    //navigation menu to go back, forward, or quit the program.
    print(
        "\nAnswer Submitted\nPrevious [P], Next [N], Quit [Q], Any other key repeat question");

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
      if (i == len) {
        i = 0;
      }
    }
  }
  //print the score

  print("\nScore: ${quiz.overallGrade()}");

  //ask user for review
  print("\nWould you like to review? Yes/No");
  var response = "";
  response = stdin.readLineSync()!;

  //review questions
  if (response.toLowerCase() == "yes") {
    new QPrinter().review(quiz);
  } else {
    print("\nGoodbye!!!");
  }
}
