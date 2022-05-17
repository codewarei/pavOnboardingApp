class Ad {
  late String id;
  late String adName;


  Ad(
      {
        required this.id,
        required this.adName,

      });

  Ad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adName = json['adName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['adName'] = adName;

    return data;
  }
}
