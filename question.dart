class Question {
  var uAns;
  var _aAns;
  var _ques;
  var _choices;

  Question(aAns, ques, choices) {
    this._aAns = aAns;
    this._ques = ques;
    this._choices = choices;
    uAns = "";
  }

  int ansChecker() {
    var ans = int.parse(uAns);
    try {
      if (ans > 0 && ans < _choices.length + 1) {
        if (uAns == _aAns.toString()) {
          return 1;
        } else {
          return 0;
        }
      }
    } catch (u) {
      return 3;
    }
    return 3;
  }

  set userAns(uAns) {
    this.uAns = uAns;
  }

  String get ques {
    return this._ques;
  }

  String get aAns {
    return this._aAns.toString();
  }

  String get userAns {
    return this.uAns.toString();
  }

  List get choices {
    return this._choices;
  }
}

class FillInQuestion extends Question {
  FillInQuestion(aAns, ques, choices) : super(aAns, ques, choices) {
    this._aAns = aAns;
    this._ques = ques;
    uAns = "";
  }

  @override
  int ansChecker() {
    var len = _aAns.length;
    for (var j = 0; j < len; j++) {
      print("U:$uAns A:${_aAns[j]}");
      if (uAns.toLowerCase() == _aAns[j].toLowerCase()) {
        return 1;
      }
    }
    return 0;
  }
}
