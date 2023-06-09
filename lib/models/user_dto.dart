import 'dart:convert';

class User {
  final String firsName;
  final String lastName;
  final int age;

  User({
    required this.firsName,
    required this.lastName,
    required this.age,
  });

  User.fromJson(Map<String, dynamic> json)
      : firsName = json["firsName"],
        lastName = json["lastName"],
        age = json["age"];

  bool get isOld =>  age > 18;
}
