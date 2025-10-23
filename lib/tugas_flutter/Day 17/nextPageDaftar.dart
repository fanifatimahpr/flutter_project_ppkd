import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/tugas10.dart';

class nextPage extends StatefulWidget {
  const nextPage({super.key, required this.name, required this.city});

  final String name;
  final String city;

  @override
  State<nextPage> createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  static const List<Widget> _widgetOptions = [
    Tugas10(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
        SizedBox(height: 800),
        Text("Terima kasih, ", textAlign: TextAlign.justify, 
        style: TextStyle(fontSize: 16)),
        Text(widget.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(" dari ", style: TextStyle(fontSize: 16)),
        Text(widget.city, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(" telah mendaftar.", style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}