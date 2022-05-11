class User {
  late String id;
  late String firstName;
  late String lastName;
  late String phoneNumber;

  User(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
     return data;
  }
}
