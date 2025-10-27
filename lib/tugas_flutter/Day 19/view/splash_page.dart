import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/preferencehandler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/drawerday19.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signin_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signup_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
          MaterialPageRoute(builder: (context) => DrawerWidgetDay19()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SigninPageStuntinq()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color(0xfffafafa),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/Logo StuntinQ.png", height: 80, width: 80,)),
          Text(
            "StuntinQ",
            style: TextStyle(
              color: Color(0xff2f6b6a),
              fontSize: 28, 
              fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}