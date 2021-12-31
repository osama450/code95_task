
import 'dart:convert';

List<UsersResponseModel> usersResponseModelFromJson(String str) => List<UsersResponseModel>.from(json.decode(str).map((x) => UsersResponseModel.fromJson(x)));

String usersResponseModelToJson(List<UsersResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersResponseModel {
  UsersResponseModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.age,
  });

  final int userId;
  final String firstName;
  final String lastName;
  final String fullName;
  final String gender;
  final int age;

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) => UsersResponseModel(
    userId: json["user_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    gender: json["gender"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "gender": gender,
    "age": age,
  };
}
