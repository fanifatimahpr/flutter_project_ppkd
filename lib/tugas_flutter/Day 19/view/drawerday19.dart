import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmap.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/loginscreenDay18.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/preferencehandler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/createuser.dart';

class DrawerWidgetDay19 extends StatefulWidget {
  const DrawerWidgetDay19({super.key});

  @override
  State<DrawerWidgetDay19> createState() => _DrawerWidgetDay19State();
}

class _DrawerWidgetDay19State extends State<DrawerWidgetDay19> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    // InputWidgetDay16(),
    listviewDay17(),
    Listviewmap(),
    Listviewmodel(),
    CRWidgetDay19(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/habibie.jpg"),
              ),
              title: Text("Habibie"),
              subtitle: Text("Instruktur PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Input Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewList Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewListMap Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewModel Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.list),
              title: Text("CR DB Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Loginscreenday18()),
                  (route) => false,
                );
              },
              leading: Icon(Icons.outbond),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}