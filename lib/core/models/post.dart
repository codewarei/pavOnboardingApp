class PostModel {
  late String id;
  late String city;
  late String children;
  late String interest;
  late String weekends;

  PostModel(
      {required this.id,
      required this.children,
      required this.city,
      required this.interest,
      required this.weekends});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    children = json['children'];
    interest = json['interest'];
    weekends = json['weekends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    data['children'] = children;
    data['interest'] = interest;
    data['weekends'] = weekends;

    return data;
  }
}
