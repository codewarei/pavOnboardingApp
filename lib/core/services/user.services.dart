import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:inspirze_onboarding_app/core/constant/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/widgets/progress_indicator_widget.dart';
import '../headers/headers.dart';

class UserService {
  late SharedPreferences preferences;
  late String deviceRefreshToken;

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

}