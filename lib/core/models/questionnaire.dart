class Questionnaire {
  late String id;
  late String place;
  late String children;
  late String interests;
  late String weekends;


  Questionnaire({
    required this.id,
    required this.children, required this.interests, required this.place, required this.weekends
  });

  Questionnaire.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    place = json['place'];
    children = json['children'];
    interests = json['interests'];
    weekends = json['weekends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['place'] = place;
    data['children'] = children;
    data['interests'] = interests;
    data['weekends'] = weekends;

    return data;
  }
}
