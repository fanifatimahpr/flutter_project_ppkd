import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/loginbutton.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/database/dbhelper.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/model/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CRWidgetDay19 extends StatefulWidget {
  const CRWidgetDay19({super.key});

  @override
  State<CRWidgetDay19> createState() => _CRWidgetDay19State();
}

class _CRWidgetDay19State extends State<CRWidgetDay19> {
  final fullnameC = TextEditingController();
  final phonenumberC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  getData() {
    DbHelper.getAllUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("Pendaftaran User", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Full Name", controller: fullnameC),
            buildTextField(hintText: "Phone Number", controller: phonenumberC),
            buildTextField(hintText: "Email", controller: emailC),
            buildTextField(hintText: "Password", controller: passwordC),

            LoginButton(
              text: "Tambahkan",
              onPressed: (){
                if (fullnameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nama belum diisi");
                } else if (phonenumberC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nomor HP belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else if (passwordC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Password belum diisi");
                } else {
                   final UserModel dataStudent = UserModel(
                    fullname: fullnameC.text,
                    phonenumber: phonenumberC.text,
                    email: emailC.text,
                    password: passwordC.text,
                  );
                   DbHelper.createStudent(dataStudent).then((value) {
                    fullnameC.clear();
                    phonenumberC.clear();
                    emailC.clear();
                    passwordC.clear();
                    getData();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color.fromARGB(255, 191, 236, 232),
                      content: Text("Password belum diisi",
                      style: TextStyle(color: Colors.black),),),);
                  });
                }
                },
              ),
              SizedBox(height: 30),
              FutureBuilder(
                future: DbHelper.getAllUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    final data = snapshot.data as List<UserModel>;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final items = data[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(items.fullname??"Nama tidak terdaftar"),
                                subtitle: Text(items.email??"Email tidak terdaftar"),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              ])
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
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
