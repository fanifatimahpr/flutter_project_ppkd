// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    String? message;
    Data? data;

    RegisterModel({
        this.message,
        this.data,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

// class LoginModel {
//   final bool success;
//   final String message;
//   final String token;
//   final User user;

//   LoginModel({
//     required this.success,
//     required this.message,
//     required this.token,
//     required this.user,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) {
//     return LoginModel(
//       success: json["success"],
//       message: json["message"],
//       token: json["token"],
//       user: User.fromJson(json["user"]),
//     );
//   }
// }

// class EditUserModel {
//   final bool success;
//   final String message;
//   final Data data;

//   EditUserModel({
//     required this.success,
//     required this.message,
//     required this.data,
//   });

//   factory EditUserModel.fromJson(Map<String, dynamic> json) {
//     return EditUserModel(
//       success: json["success"],
//       message: json["message"],
//       data: Data.fromJson(json["data"]),
//     );
//   }
// }

class Data {
    String? token;
    User? user;

    Data({
        this.token,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    String? name;
    String? email;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    User({
        this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
