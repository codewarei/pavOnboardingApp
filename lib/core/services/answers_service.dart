import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:inspirze_onboarding_app/core/models/answer.dart';
import '../../ui/admin/views/answers/answers_view.dart';
import '../constant/headers.dart';


class AnswerService {
  final String apiUrl = "https://serene-forest-25036.herokuapp.com/api/answers";

  Future<List<Post>> fetchPost() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Post>((json) => Post.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Answer>> getAnswers() async {
    Response res = await http
        .get(Uri.parse(apiUrl), headers: AppHeaders.authenticatedHeaders());

    if (res.statusCode == 200) {

      List<dynamic> body = jsonDecode(res.body);
      List<Answer> answer = body.map((dynamic item) => Answer.fromJson(item)).toList();
      return answer;
    } else {
      throw "Failed to load answer list";
    }
  }

  Future<Answer> getAnswerById(String id) async {

    final response =  await http.get(Uri.parse('$apiUrl/$id'), headers: AppHeaders.authenticatedHeaders());

    if (response.statusCode == 200) {
      return Answer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a answer');
    }
  }

  Future<Answer> createAnswer(Answer answer) async {
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
      body: jsonEncode(answer.toJson()),
    );
    if (response.statusCode == 200) {
      return Answer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post ad');
    }
  }

  Future<Answer> updateAnswer(String id, Answer answer) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(answer.toJson()),
    );
    if (response.statusCode == 200) {
      return Answer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a answer');
    }
  }

  Future<void> deleteAnswer(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Answer deleted");
    } else {
      throw "Failed to delete a Answer.";
    }
  }
}
