class Question {
  late String id;
  late String question1;
  late String question2;
  late String question3;

  Question({
    required this.id,
    required this.question1, required this.question2, required this.question3
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question1 = json['question1'];
    question2 = json['question2'];
    question3 = json['question3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question1'] = question1;
    data['question2'] = question2;
    data['question3'] = question3;

    return data;
  }
}
