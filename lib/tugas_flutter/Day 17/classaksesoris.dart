import 'package:flutter/widgets.dart';

class ATKModel {
  final String name;
  final int price;
  final String image;
  final Color? backgroundColor;
  ATKModel({
    required this.name,
    required this.price,
    required this.image,
    this.backgroundColor
  });
}