import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmap.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/loginscreenDay18.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/preferencehandler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/listuser.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signin_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signup_page.dart';

class DrawerWidgetDay19 extends StatefulWidget {
  const DrawerWidgetDay19({super.key});

  @override
  State<DrawerWidgetDay19> createState() => _DrawerWidgetDay19State();
}

class _DrawerWidgetDay19State extends State<DrawerWidgetDay19> {
  int _selectedIndex = 0;
  static const List<String> _titles = ["Home"];
  static const List<Widget> _widgetOptions = [
    ListUserPage(),
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
      appBar: AppBar(title: 
      Text(_titles[_selectedIndex]), backgroundColor: Color.fromARGB(255, 167, 235, 229),),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Logo StuntinQ.png"),
              ),
              title: Text("StuntinQ"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            Divider(),

             ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SigninPageStuntinq()),
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