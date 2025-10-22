import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/Switchpage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/datepickerPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/dropdownPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/syaratketentuan_Page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/timepickerPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmap.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmodel.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    listviewDay17(),
    Listviewmap(),
    Listviewmodel(),
  ];
  void onTapDrawer(int Index) {
    setState(() {
      _selectedIndex = Index;
    });
   Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Menu" ),
      backgroundColor: Color.fromARGB(255, 191, 236, 232),),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("List Alat Tulis Kantor"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("List Map Alat Tulis Kantor"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("List Model Alat Tulis Kantor"),
            ),
            Divider(),

          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}