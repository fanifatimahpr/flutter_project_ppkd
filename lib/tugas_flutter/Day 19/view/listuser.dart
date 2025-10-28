import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/loginbutton.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2018/loginscreenDay18.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/database/dbhelper.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2019/model/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final fullnameC = TextEditingController();
  final emailC = TextEditingController();
  getData() {
    DBHelper.getAllUser();
    setState(() {});
  }

  //Edit User  
   Future<void> _onEdit(UserModel user) async {
    final editFullnameC = TextEditingController(text: user.fullname);
    final editEmailC = TextEditingController(text: user.email);
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              buildTextField(hintText: "Name", controller: editFullnameC),              
              buildTextField(hintText: "Email", controller: editEmailC),
              
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = UserModel(
        id: user.id,
        fullname: editFullnameC.text,
        email: editEmailC.text,
      //   age: int.parse(editAgeC.text),
      );
      DBHelper.updateUser(updated);
      getData();
      Fluttertoast.showToast(msg: "Data berhasil di update");
    }
  }

  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${user.fullname}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DBHelper.deleteUser(user.id!);
      getData();
      Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("List User", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
               Expanded(
                 child: FutureBuilder(
                   future: DBHelper.getAllUser(),
                   builder: (BuildContext context, AsyncSnapshot snapshot) {
                    // print(snapshot.data);
                     if (snapshot.connectionState == ConnectionState.waiting) {
                       return CircularProgressIndicator();
                     } else if (snapshot.data == null || snapshot.data.isEmpty) {
                       return Column(
                         children: [
                           Text("Data belum ada"),
                         ],
                       );
                     } else {
                       final data = snapshot.data as List<UserModel>;
                       return ListView.builder(
                         itemCount: data.length,
                         itemBuilder: (BuildContext context, int index) {
                           final items = data[index];
                           return Column(
                             children: [
                               ListTile(
                                 title: Text(items.fullname),
                                 subtitle: Text(items.email),
                                 trailing: Row(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     IconButton(
                                       onPressed: () {
                                         _onEdit(items);
                                       },
                                       icon: Icon(Icons.edit),
                                     ),
                                     IconButton(
                                       onPressed: () {
                                         _onDelete(items);
                                       },
                                       icon: Icon(Icons.delete,),
                                     ),
                                   ],
                                 ),
                               )
                             ],
                           );
                         },
                       );
                           }}),
               )],           
            ),
      ),
               ); }
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
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
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
            width: 1.0,
          ),
        ),
      ),
    );
  }
