import 'package:task1/api/baseapi.dart';

class Question {
  String? id;
  String? question;
  Question({this.id = "", this.question = ""});
  factory Question.fromjson(Map<String, dynamic> json) {
    return Question(id: json["id"], question: json["question"]);
  }

  Future<List<Question>> get(String userid) async {
    return BaseApi().get(pathUrl: "question", body: {"user_id": userid}).then((value) {
      List<dynamic> items = value["ireme_question"] as List;
      List<Question> questions = items.map((e) => Question.fromjson(e)).toList();
      return questions;
    }).catchError((onError) {
      throw onError.toString();
    });
  }

  Future sendQuestion(String question) async {
    return await BaseApi()
        .post(baseUrl: BaseApi().basuUrl, pathUrl: "question", body: {"question": question}).then((value) {
      return true;
    }).catchError((onError) {
      throw onError;
    });
  }

  Future<bool> answer({String answer = "", String questionid = ""}) async {
    return await BaseApi().post(
        baseUrl: BaseApi().basuUrl,
        pathUrl: "question/response",
        body: {"question_id": questionid, "answer": answer.toString()}).then((value) {
      return true;
    }).catchError((onError) {
      throw onError;
    });
  }
}
