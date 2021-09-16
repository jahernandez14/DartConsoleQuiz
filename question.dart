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

  bool ansChecker() {
    bool result = false;

    if (uAns.substring(0, 1).toLowerCase() ==
            _aAns.substring(0, 1).toLowerCase() ||
        uAns.toLowerCase() == _aAns.toLowerCase()) {
      result = true;
    }

    return result;
  }

  set userAns(uAns) {
    this.uAns = uAns;
  }

  String get ques {
    return this._ques;
  }

  String get aAns {
    return this._aAns;
  }

  String get userAns {
    return this.uAns;
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
  bool ansChecker() {
    bool result = false;
    if (uAns.toLowerCase() == _aAns.toLowerCase()) {
      result = true;
    }
    return result;
  }
}
