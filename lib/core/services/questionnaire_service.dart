import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:inspirze_onboarding_app/core/models/answer.dart';
import 'package:inspirze_onboarding_app/core/models/questionnaire.dart';
import '../constant/headers.dart';

class QuestionnaireService {
  final String apiUrl = "https://serene-forest-25036.herokuapp.com/api/questionnaire";

  Future<List<Questionnaire>> getQuestionnaire() async {
    Response res = await http
        .get(Uri.parse(apiUrl), headers: AppHeaders.authenticatedHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Questionnaire> questionnaire = body.map((dynamic item) => Questionnaire.fromJson(item)).toList();
      return questionnaire;
    } else {
      throw "Failed to load questionnaire list";
    }
  }

  Future<Questionnaire> getQuestionnaireById(String id) async {

    final response =  await http.get(Uri.parse('$apiUrl/$id'), headers: AppHeaders.authenticatedHeaders());

    if (response.statusCode == 200) {
      return Questionnaire.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a answer');
    }
  }

  Future<Questionnaire> createQuestionnaire(Questionnaire questionnaire) async {
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
      body: jsonEncode(questionnaire.toJson()),
    );
    if (response.statusCode == 200) {
      return Questionnaire.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to questionnaire ad');
    }
  }

  Future<Questionnaire> updateQuestionnaire(String id, Questionnaire questionnaire) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(questionnaire.toJson()),
    );
    if (response.statusCode == 200) {
      return Questionnaire.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a questionnaire');
    }
  }

  Future<void> deleteAd(String id) async {
    Response res = await delete(Uri.parse('$apiUrl + answer'));

    if (res.statusCode == 200) {
      print("Answer deleted");
    } else {
      throw "Failed to delete a Answer.";
    }
  }
}