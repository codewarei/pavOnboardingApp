import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant/headers.dart';
import '../models/ad.dart';

class AdService {
  final String apiUrl = "https://serene-forest-25036.herokuapp.com/api/ads";

  Future<List<Ad>> getAds() async {
    Response res = await http
        .get(Uri.parse(apiUrl), headers: AppHeaders.unAuthenticatedHeaders());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Ad> ads = body.map((dynamic item) => Ad.fromJson(item)).toList();
      print(ads);
      return ads;
    } else {
      throw "Failed to load ads list";
    }
  }

  Future<List<Ad>> fetchAds() async {
    final response =
    await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Ad>((json) => Ad.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Ad> getAdById(String id) async {
    final response =  await http.get(Uri.parse('$Ad/$id'), headers: AppHeaders.authenticatedHeaders());

    if (response.statusCode == 200) {
      return Ad.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a ad');
    }
  }

  Future<Ad> createAd(Ad ad) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };
    final Response response = await post(
      Uri.parse('$apiUrl + ad'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ad.toJson()),
    );
    if (response.statusCode == 200) {
      return Ad.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post ad');
    }
  }

  Future<Ad> updateAds(String id, Ad ad) async {
    // Map data = {
    //   'adName': ad.adName,
    //
    // };
    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ad.toJson()),
    );
    if (response.statusCode == 200) {
      return Ad.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a ad');
    }
  }

  Future<void> deleteAd(String id) async {
    Response res = await delete(Uri.parse('$Ad/$id'));

    if (res.statusCode == 200) {
      print("Ad deleted");
    } else {
      throw "Failed to delete a ad.";
    }
  }
}