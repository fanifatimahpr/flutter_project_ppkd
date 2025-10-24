import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/nextPageDaftar.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';

class SignupPageStuntinq extends StatefulWidget {
  const SignupPageStuntinq  ({super.key});

  @override
  State<SignupPageStuntinq > createState() => _SignupPageStuntinqState();
}
class _SignupPageStuntinqState extends State<SignupPageStuntinq>  {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildLayer()]));
  }
  // login() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => nextPage()),
  //   );
  // }

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
              Image.asset('assets/images/Logo StuntinQ.png', height: 20, width: 20,),
              Text("Sign Up", 
                style: TextStyle(
                  color: Color(0xff2f6b6a),
                  fontSize: 28, 
                  fontWeight: FontWeight.bold)),
            
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
                  },),

        //Daftar
        height(20),
        Container(
          width: 417.21,
          height: 48.14,
          decoration: 
          BoxDecoration(color: Color(0xff2f6b6a), 
          borderRadius: BorderRadius.circular(12)),
          child: TextButton(onPressed: (){
            if(_formKey.currentState!.validate()) {
              print(fullnameController.text);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
              nextPage(name: fullnameController.text, city: phonenumberController.text,),),);
            }
            else {
              showDialog(context: context,
              builder: (context){
                return AlertDialog(title: Text("Validation Error"),
                content: Text("Please fill all fields"),
                actions:[
                  TextButton(child: Text("Yes"),
                  onPressed: (){
                    Navigator.pop(context);
                  },),
                  TextButton(child: Text("No"),
                  onPressed: (){
                    Navigator.pop(context);
                  },)
                ]);
              });
            }
          }, 

          child: Text("Sign Up", 
          style: TextStyle(
            fontSize: 18, 
            color: Colors.white, 
            fontWeight: FontWeight.bold))),
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
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
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
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
              



              ],
            );
             
}
}
