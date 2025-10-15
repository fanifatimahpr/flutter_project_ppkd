import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 229, 255),
      appBar: AppBar(title: Text("Formulir dan Daftar Produk",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 0, 0)),), 
        backgroundColor: const Color.fromARGB(255, 110, 155, 224),
         ),
      
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        children: [
            Text("Input Your Personal Data", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Name", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder(),
                hintText: "Enter Your Full Name",
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 10,),
            Text("Email", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder(),
                hintText: "Enter Your Email (***@gmail.com)",
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 10,),
            Text("Phone Number", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder(),
                hintText: "Enter Your Active Phone Number",
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 10,),
            Text("Description", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder(),
                hintText: "Enter a Short Description About Yourself",
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Text("Daftar Produk", 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
            
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 14, right:14),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: const Color.fromARGB(255, 10, 55, 105),
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),],
                color: const Color.fromARGB(255, 115, 164, 238), 
                borderRadius: BorderRadius.all(Radius.circular(8),
                
              ),),

            child: ListTile(
              leading: Image.asset('assets/images/pisang.png'),
              title: Text("Cavendish Banana", 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,),),
              subtitle: Text("Rp24.000/kg",
              style: TextStyle(
                fontSize: 14
              ),),
              trailing: Icon(Icons.thumb_up),
            ),
            ),
            
            SizedBox(
              height: 10,
            ),

             Container(
              padding: const EdgeInsets.only(left: 14, right:14),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: const Color.fromARGB(255, 10, 55, 105),
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),],
                color: const Color.fromARGB(255, 115, 164, 238), 
                borderRadius: BorderRadius.all(Radius.circular(8),
                
              ),),

            child: ListTile(
              leading: Image.asset('assets/images/anggur.png'),
              title: Text("Red Globe Grape", 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,),),
              subtitle: Text("Rp45.900/kg",
              style: TextStyle(
                fontSize: 14
              ),),
              trailing: Icon(Icons.thumb_up),
              ),
              ),

            SizedBox(
              height: 10,
            ),

             Container(
              padding: const EdgeInsets.only(left: 14, right:14),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: const Color.fromARGB(255, 10, 55, 105),
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),],
                color: const Color.fromARGB(255, 115, 164, 238), 
                borderRadius: BorderRadius.all(Radius.circular(8),
                
              ),),

            child: ListTile(
              leading: Image.asset('assets/images/mangga.png'),
              title: Text("Mango", 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,),),
              subtitle: Text("Rp32.000/kg",
              style: TextStyle(
                fontSize: 14
              ),),
              ),),

            SizedBox(
              height: 10,
            ),

             Container(
              padding: const EdgeInsets.only(left: 14, right:14),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: const Color.fromARGB(255, 10, 55, 105),
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),],
                color: const Color.fromARGB(255, 115, 164, 238), 
                borderRadius: BorderRadius.all(Radius.circular(8),
                
              ),),

            child: ListTile(
              leading: Image.asset('assets/images/lychee.png'),
              title: Text("Lychee", 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,),),
              subtitle: Text("Rp63.000/kg",
              style: TextStyle(
                fontSize: 14
              ),),
              trailing: Icon(Icons.thumb_up),
              ),),

            SizedBox(
              height: 10,
            ),

             Container(
              padding: const EdgeInsets.only(left: 14, right:14),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: const Color.fromARGB(255, 10, 55, 105),
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 2,
                ),],
                color: const Color.fromARGB(255, 115, 164, 238), 
                borderRadius: BorderRadius.all(Radius.circular(8),
                
              ),),

            child: ListTile(
              leading: Image.asset('assets/images/peach fruit.png'),
              title: Text("Local Peach", 
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,),),
              subtitle: Text("Rp68.000/kg",
              style: TextStyle(
                fontSize: 14
              ),),
              ),),
    ],),);
  }
}