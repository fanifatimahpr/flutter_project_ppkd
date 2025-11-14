import 'dart:convert';
import 'dart:developer';

import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/constans/endpoint.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/loginmodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/profil_model.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/models/registermodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/preferences/preference_handler.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

    static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        "email": email,
        "password": password,
      },
    );

    log("LOGIN: ${response.body}");

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
  
  static Future<ProfileModel> getProfile() async {
    final token = await PreferenceHandlerDay33.getToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login kembali.');
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.get(
      url,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    log('Get Profile Response: ${response.body}');
    log('Get Profile Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(responseBody);
    } else if (response.statusCode == 401) {
      throw Exception(
        responseBody['message'] ?? 'Sesi berakhir. Silakan login kembali.',
      );
    } else {
      throw Exception(
        responseBody['message'] ?? 'Gagal mengambil data profil.',
      );
    }
  }

  static Future<ProfileModel> updateProfile({required String name}) async {
    final token = await PreferenceHandlerDay33.getToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login kembali.');
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.put(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({'name': name}),
    );

    log('Update Profile Response: ${response.body}');
    log('Update Profile Status Code: ${response.statusCode}');

    final responseBody = json.decode(response.body);

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(responseBody);
    } else if (response.statusCode == 422) {
      // Gagal validasi, misal: nama kosong
      final errors = responseBody['errors'] as Map<String, dynamic>;
      final firstError = errors.values.first[0];
      throw Exception(firstError);
    } else if (response.statusCode == 401) {
      throw Exception(
        responseBody['message'] ?? 'Sesi berakhir. Login kembali.',
      );
    } else {
      throw Exception(responseBody['message'] ?? 'Gagal memperbarui profil.');
    }
  }
}