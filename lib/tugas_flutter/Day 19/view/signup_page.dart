import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/loginbutton.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/nextPageDaftar.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/database/dbhelper.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/model/usermodel.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/view/signin_page.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPageStuntinq extends StatefulWidget {
  const SignupPageStuntinq({super.key});
  static const id = "/Sign Up";

  State<SignupPageStuntinq> createState() => _SignupPageStuntinqState();
}

class _SignupPageStuntinqState extends State<SignupPageStuntinq> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isFilled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildLayer()]));
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
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xff2f6b6a),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                height(30),
                buildTextField(
                  hintText: "Full name",
                  controller: fullnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama harus diisi";
                    }
                    return null;
                  },
                ),

                height(15),
                buildTextField(
                  hintText: "Phone Number",
                  controller: phonenumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nomor telepon harus diisi";
                    }
                    return null;
                  },
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
                height(25),

                //Sign Up
                LoginButton(
                  text: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final UserModel data = UserModel(
                        fullname: fullnameController.text,
                        phonenumber: phonenumberController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      DBHelper.registerUser(data);
                      Fluttertoast.showToast(msg: "Sign Up Berhasil");
                      Navigator.pop(context);
                    } else {}
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
                      "Have an account?",
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
                            builder: (context) => SigninPageStuntinq(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
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
