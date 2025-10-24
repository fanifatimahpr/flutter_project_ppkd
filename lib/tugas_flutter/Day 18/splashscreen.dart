import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/loginscreenDay18.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/preferencehandler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signup_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
    void initState() {
    super.initState();
    isLoginFunction();
  }


   isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignupPageStuntinq()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignupPageStuntinq()),
          (route) => false,
        );
      }
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 149, 231, 224), Color.fromARGB(255, 214, 240, 238)],
            begin: AlignmentGeometry.topLeft, end: AlignmentGeometry.topRight),
            
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/book.png", height: 80, width: 80,),),
            Text(
              "My Apps",
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}