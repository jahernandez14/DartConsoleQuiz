class QPrinter {
  void printQ(question, questionNum) async {
    if (question.type == 1) {
      print("\nQuestion $questionNum: ${question.ques}\n");
      var len = question.choices.length;
      for (var j = 0; j < len; j++) {
        print("${j + 1}) ${question.choices[j]}");
      }
    } else {
      print("\nQuestion $questionNum: ${question.ques}\n");
    }
  }
}
