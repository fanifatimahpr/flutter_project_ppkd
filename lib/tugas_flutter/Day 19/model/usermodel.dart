import 'dart:convert';

class UserModel {
  int? id;
  String? fullname;
  String? phonenumber;
  String? email;
  String? password;
  UserModel({
    this.id, 
    required this.fullname, 
    required this.phonenumber, 
    required this.email, 
    required this.password
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'full name': fullname,
      'phone number' : phonenumber,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      fullname: map['full name'] != null ? map['full name'] as String : null,
      phonenumber: map['phone number'] != null ? map['phone number'] as String: null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}