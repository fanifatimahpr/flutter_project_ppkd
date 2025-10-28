import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/loginbutton.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/nextPageDaftar.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/preferencehandler.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/database/dbhelper.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/model/usermodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/drawerday19.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signin_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signup_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPageStuntinq extends StatefulWidget {
  const SigninPageStuntinq({super.key});

  @override
  State<SigninPageStuntinq> createState() => _SigninPageStuntinqState();
}

class _SigninPageStuntinqState extends State<SigninPageStuntinq> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  login() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DrawerWidgetDay19()),
    );
  }

  final _formKey = GlobalKey<FormState>();
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logo StuntinQ.png',
                  height: 80,
                  width: 80,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color(0xff2f6b6a),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                height(15),
                buildTextField(
                  hintText: "Email Adress",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email harus diisi";
                    } else if (!value.contains('@')) {
                      return "Email tidak valid";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return "Format Email tidak valid";
                    }
                    return null;
                  },
                ),

                height(15),
                buildTextField(
                  hintText: "Password",
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password harus diisi";
                    } else if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),

                //Sign In
                LoginButton(
                  text: "Sign In",
                  onPressed: () async {
                    final data = await DBHelper.loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      PreferenceHandler.saveLogin(true);
                      // final data = await DBHelper.loginUser(
                      //   email: emailController.text,
                      //   password: passwordController.text,
                      // );
                      if (data != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrawerWidgetDay19(),
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Email atau password salah",
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Validation Error"),
                            content: Text("Please fill all fields"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                height(25),
                //Or Sign In
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 1),
                      ),
                    ),
                    Text(
                      "Or Sign In With",
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 97, 97, 97),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 1),
                      ),
                    ),
                  ],
                ),
                height(15),

                //Google logo
                Center(
                  child: Image.asset(
                    "assets/images/google2.png",
                    height: 40,
                    width: 40,
                  ),
                ),

                //have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an account?",
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 97, 97, 97),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPageStuntinq(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2f6b6a),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 2.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
