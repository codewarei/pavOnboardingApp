import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:inspirze_onboarding_app/core/models/answer.dart';
import 'package:inspirze_onboarding_app/core/models/question.dart';
import '../constant/headers.dart';


class QuestionService {
  final String apiUrl = "https://serene-forest-25036.herokuapp.com/api/questions";

  Future<List<Question>> getQuestions() async {
    Response res = await http
        .get(Uri.parse(apiUrl), headers: AppHeaders.authenticatedHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Question> question = body.map((dynamic item) => Question.fromJson(item)).toList();
      return question;
    } else {
      throw "Failed to load questions list";
    }
  }

  Future<Question> getQuestionById(String id) async {

    final response =  await http.get(Uri.parse('$apiUrl/$id'), headers: AppHeaders.authenticatedHeaders());

    if (response.statusCode == 200) {
      return Question.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a question');
    }
  }

  Future<Question> createQuestion(Question question) async {
    // Map data = {
    //   'answer1': answer.answer1,
    //   'answer2': answer.answer2,
    //   'answer3': answer.answer3,
    //
    // };
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(question.toJson()),
    );
    if (response.statusCode == 200) {
      return Question.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to question ad');
    }
  }

  Future<Question> updateQuestion(String id, Question question) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(question.toJson()),
    );
    if (response.statusCode == 200) {
      return Question.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a question');
    }
  }

  Future<void> deleteQuestion(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Answer deleted");
    } else {
      throw "Failed to delete a Answer.";
    }
  }
}