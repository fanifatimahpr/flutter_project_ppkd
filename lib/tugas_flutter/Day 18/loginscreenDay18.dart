import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/listview.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/nextPageDaftar.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';

class Loginscreenday18 extends StatefulWidget {
  const Loginscreenday18 ({super.key});

  @override
  State<Loginscreenday18> createState() => _Loginscreenday18State();
}

class _Loginscreenday18State extends State<Loginscreenday18 > {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 240, 238),
      appBar: AppBar(title: Text("Formulir Pendaftaran Kelas Flutter", 
      style: TextStyle(fontWeight: FontWeight.bold)), 
      backgroundColor: Color.fromARGB(255, 167, 235, 229)),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Text("Mohon isi form ini sesuai instruksi", 
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold)),
            
            height(20),
            buildTitle("Name"),
            height(10),
            height(10),
        buildTextField(
                  hintText: "Enter your full name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama harus diisi";
                    }
                    return null;
                  },
                ),


        height(15),
        buildTitle("Email"),
        height(10),
        buildTextField(
                  hintText: "Enter your email",
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
        buildTitle("Phone Number"),
        height(10),
        buildTextField(
                  hintText: "Enter your phone number"),

        height(15),
        buildTitle("City Of Domicile"),
        height(10),
        buildTextField(
          hintText: "Enter your city of domicile",
          controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kota domisili harus diisi";
                    }
                    return null;
                  },),

        //Daftar
        height(20),
        Container(
          width: 417.21,
          height: 48.14,
          decoration: BoxDecoration(color: Color.fromARGB(255, 167, 235, 229), borderRadius: BorderRadius.circular(10.7)),
          child: TextButton(onPressed: (){
            if(_formKey.currentState!.validate()) {
              print(nameController.text);
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
              nextPage(name: nameController.text, city: cityController.text,),),);
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
          child: Text("Daftar", 
          style: TextStyle(
            fontSize: 21.74, 
            color: Colors.black, 
            fontWeight: FontWeight.bold))),
            ),],
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
SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
