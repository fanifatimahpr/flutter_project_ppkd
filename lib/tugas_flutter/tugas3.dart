import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 219, 219),
      appBar: AppBar(title: Text("Formulir dan Gallery Grid",style: TextStyle(color: const Color.fromARGB(255, 241, 238, 238)),), backgroundColor: const Color.fromARGB(255, 110, 44, 44), ),
      
      //Menampilkan Formulir
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Input Your Personal Data", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
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
          
          //Menampilkan Text Gallery Grid
          Text("Gallery Grid", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          
          //Menampilkan 6 Kotak Grid
          GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 110, 44, 44),
                borderRadius: BorderRadius.circular(24),
              ),

          child: Stack(
            children: [Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Box ${index + 1}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 224, 209, 209)),),
            )],
          ),
            );
          },
        ),],
        ),
        ),
      ),
    );
  }
}