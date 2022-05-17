import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:inspirze_onboarding_app/core/constant/config.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/auth/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/widgets/progress_indicator_widget.dart';
import '../headers/headers.dart';
import '../models/user.dart';

class UserService {
  late SharedPreferences preferences;
  late String deviceRefreshToken;

  final String apiUrl = "https://serene-forest-25036.herokuapp.com/api/users";


  Future<http.Response?> signIn(String firstName,String phoneNumber ,BuildContext context) async {
    try {
      showLoaderDialog(context: context, loadingMessage: "Trying to login...");
      final body = jsonEncode({
        'firstName': firstName,
        'phoneNumber': phoneNumber,
      });
       String url = 'https://inspirze-onboarding-api.herokuapp.com/api/auth/login';

      // String url = '${Config.api}/user/login';
      final response = await http.post(Uri.parse(url), body: body, headers: AppHeaders.unAuthenticatedHeaders());

      return response;
    }catch(e) {
      return null;
    }finally{
      Navigator.pop(context);//Always include this when you've called  showLoaderDialog widget
    }
  }

  Future<http.Response?> adminLogin(String email,String password ,BuildContext context) async {
    try {
      showLoaderDialog(context: context, loadingMessage: "Trying to login...");
      final body = jsonEncode({
        'email': email,
        'password': password,
      });
      String url = 'https://serene-forest-25036.herokuapp.com/auth/login';

      // String url = '${Config.api}/user/login';
      final response = await http.post(Uri.parse(url), body: body, headers: AppHeaders.unAuthenticatedHeaders());

      return response;
    }catch(e) {
      return null;
    }finally{
      Navigator.pop(context);//Always include this when you've called  showLoaderDialog widget
    }
  }

  // Future<http.Response?> createForm(String city,String children ,String interest,String weekends,String firstName,BuildContext context) async {
  //   try {
  //     showLoaderDialog(context: context, loadingMessage: "Trying to login...");
  //     final body = jsonEncode({
  //       'city': city,
  //       'children': children,
  //       'interest': interest,
  //       'weekends': weekends,
  //       'firstName': firstName,
  //     });
  //     // String urll= 'http://192.168.8.100:6000/api/auth/login';
  //     var url = Uri.http(Config.apiUrl, Config.loginApi);
  //     final response = await client.post((url), body: body, headers: AppHeaders.unAuthenticatedHeaders());
  //
  //     return response;
  //   }catch(e) {
  //     return null;
  //   }finally{
  //     Navigator.pop(context);//Always include this when you've called  showLoaderDialog widget
  //   }
  // }

  // static Future<Map<String, List<TankPing>>> fetchPing() async {
  //   String url3 = 'https://api.orbital.katsana.com/devices/graph-data';
  //   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //   final SharedPreferences prefs = await _prefs;
  //   final token = prefs.getString('access_token');
  //   final response3 = await http.get(url3, headers: {
  //     'Authorization': 'Bearer $token'
  //   });
  //
  //   if(response3.statusCode == 200) {
  //     final tankPings = tankPingFromJson(response3.body);
  //     return tankPings;
  //   }else if(response3.statusCode == 400) {
  //     print('Connection to server is bad');
  //   }else if(response3.statusCode == 500){
  //     print('No authorization');
  //   }
  // }

  Future<List<User>> getUsers() async {
    Response res = await http
        .get(Uri.parse(apiUrl), headers: AppHeaders.authenticatedHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw "Failed to load users list";
    }
  }

  Future<User> getUserById(String id) async {

    final response =  await http.get(Uri.parse('$apiUrl/$id'), headers: AppHeaders.authenticatedHeaders());

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a user');
    }
  }

  Future<User> createUser(User user) async {
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
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<User> updateUser(String id, User user) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a user');
    }
  }

  Future<void> deleteUser(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("User deleted");
    } else {
      throw "Failed to delete a User.";
    }
  }

}