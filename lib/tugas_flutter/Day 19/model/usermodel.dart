import 'dart:convert';

class UserModel {
  int? id;
  String fullname;
  String email;
  String phonenumber;
  String password;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phonenumber,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      fullname: map['name'] as String,
      phonenumber: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}