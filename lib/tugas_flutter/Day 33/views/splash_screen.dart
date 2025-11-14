import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/drawerday19.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/preferences/preference_handler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2033/views/register_day33.dart';

class SplashScreenDay33 extends StatefulWidget {
const SplashScreenDay33({super.key});

@override
State<SplashScreenDay33> createState() => _SplashScreenDay33State();
}

class _SplashScreenDay33State extends State<SplashScreenDay33> {
@override
void initState() {
super.initState();
isLoginFunction();
}

isLoginFunction() async {
Future.delayed(Duration(seconds: 3)).then((value) async {
var isLogin = await PreferenceHandlerDay33.getLogin();
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
          MaterialPageRoute(builder: (context) => SignupPageDay33()),
(route) => false,
);
}
});
}



@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff00072d), Color(0xff0a2472)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/Logo StuntinQ.png',
                height: 160,
                width: 160,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "StuntinQ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}