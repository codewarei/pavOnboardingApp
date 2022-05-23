import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Ad {
  late String id;
  late String adName;
  late bool seen;


  Ad(
      {
        required this.id,
        required this.adName,
        required this.seen

      });

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adName = json['adName'];
    seen = json['seen'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['adName'] = adName;
    data['seen'] = seen;

    return data;
  }
}

List<Ad> postFromJson(String str) =>
    List<Ad>.from(json.decode(str).map((x) => Ad.fromJson(x)));

class Person {
  String id;
  String adName;
  String seen;
  Person({required this.id, required this.adName, required this.seen});

  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    return Person(
        id: parsedJson['id'] ?? "",
        adName: parsedJson['adName'] ?? "",
        seen: parsedJson['seen'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "adName": this.adName,
      "seen": this.seen,
    };
  }
}

// void _savePersons(List<Person> persons) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   List<String> personsEncoded = persons.map((person) => jsonEncode(person.toJson())).toList();
//   await sharedPreferences.setStringList('accounts', accounts);
// }
//
// List<Person> _getPersons(List<Person> persons) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   await sharedPreferences.setStringList('accounts', accounts);
//   return persons.map((person) => Person.fromJson(person)).toList();
// }
//
