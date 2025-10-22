import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/Switchpage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/datepickerPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/dropdownPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/syaratketentuan_Page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/timepickerPage.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    SyaratketentuanPage(),
    Switchpage(),
    Dropdownpage(),
    Datepickerpage(),
    Timepickerpage(),

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
              leading: Icon(Icons.check),
              title: Text("Syarat & Ketentuan"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.switch_access_shortcut),
              title: Text("Mode Gelap"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.category),
              title: Text("Kategori Produk"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.calendar_month),
              title: Text("Tanggal Lahir"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.lock_clock),
              title: Text("Waktu Pengingat"),
            ),
            Divider(),


          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}