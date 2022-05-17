class Answer {
  late String id;
  late String answer1;
  late String answer2;
  late String answer3;

  Answer({
        required this.id,
        required this.answer1, required this.answer3, required this.answer2
      });

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer1 = json['answer1'];
    answer2 = json['answer2'];
    answer3 = json['answer3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer1'] = answer1;
    data['answer2'] = answer2;
    data['answer3'] = answer3;

    return data;
  }
}
