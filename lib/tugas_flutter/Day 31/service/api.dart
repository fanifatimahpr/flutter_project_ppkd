import 'dart:convert';

import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/Model/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<Welcome>> fetchWelcome() async {
  final response = await http.get(
    Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"),
    // headers: {"x-api-key": "reqres-free-v1"},
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body);
    return userJson.map((json) => Welcome.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load user");
  }
}