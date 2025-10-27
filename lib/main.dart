import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/aboutappPage.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/syaratketentuan_Page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/tugas8.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmap.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listviewmodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/tugas10.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/tugas9.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/loginscreenDay18.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/splashscreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/drawerday19.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signin_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signup_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/splash_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugas5.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugas6.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2016/tugas7.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugasBottomNavigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashPage());
  }
}
