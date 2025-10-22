import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/aboutappPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/tugas7.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Tugas7(),
    Aboutapppage(),
    ];

  void _onItemTapped(int Index){
    setState(() {
      _selectedIndex = Index;
    });
  // Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //Bottom Navigator
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "About App"),
        ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromARGB(255, 46, 95, 91),
      onTap: _onItemTapped,
      ),
    );
  }
}