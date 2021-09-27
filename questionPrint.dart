class QPrinter {
  printQ(question, questionNum) {
    if (question.type == 1) {
      print("\nQuestion $questionNum: ${question.ques}\n");
      var len = question.choices.length;
      for (var j = 0; j < len; j++) {
        print("${j + 1}) ${question.choices[j]}");
      }
      print("Answer: ");
    } else {
      print("\nQuestion $questionNum: ${question.ques}\nAnswer: ");
    }
  }

  review(quiz) {
    var len = quiz.pool.length;

    print("\n\n\n********************Quiz Review********************");

    for (var j = 0; j < len; j++) {
      var userAnswer = quiz.pool[j].userAns;
      var actualAnswer = quiz.pool[j].aAns;
      var question = quiz.pool[j].ques;

      print("\n${j + 1}) $question\n");
      if (quiz.getGrade(j) == 1) {
        print("Correct!");
      } else {
        print("Wrong!");
      }
      print("Your Answer: $userAnswer");
      print("The Correct Answer: $actualAnswer");
    }

    print("\nScore: ${quiz.overallGrade()}");
    print("\nGoodbye!!");
  }
}
