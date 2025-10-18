import 'package:flutter/material.dart';

class textTest extends StatelessWidget {
  const textTest({
    super.key, required this.text
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, 
    style:TextStyle(
      fontSize: 14,
      color: const Color.fromARGB(255, 97, 97, 97)));
  }
}