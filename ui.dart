import 'question.dart';
import 'dart:io';


main() {
  print("Quiz");
  var i = 0;
  while (i < 3) {
    Question q1 = new Question();
    q1.newQues();
    print(q1.ques);
    var arr = q1.choices;
    var len = arr.length; 
    for(var j = 0; j<len; j++){
      print(arr[j]);
    }
    q1.userAns = stdin.readLineSync();

    if(q1.aAns == q1.userAns){
      print("Correct!");
    }
    else{
      print("Nope!");
      print("You entered: ${q1.userAns}");
      print("The correct answer was: ${q1.aAns}");
    }
    i += 1;
  }
}
