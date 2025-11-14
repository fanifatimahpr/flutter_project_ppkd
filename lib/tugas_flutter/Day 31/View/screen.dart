import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/aboutappPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/View/home_screen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2031/View/user_screen2.dart';

class Tugas14 extends StatefulWidget {
  const Tugas14({super.key});

  @override
  State<Tugas14> createState() => _Tugas14State();
}

class _Tugas14State extends State<Tugas14> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    UserScreen2(),
    HomeTabUser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],

      backgroundColor: const Color(0xff141414),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1e1e1e),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Category",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
