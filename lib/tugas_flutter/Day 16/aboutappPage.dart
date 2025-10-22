import 'package:flutter/material.dart';

class Aboutapppage extends StatefulWidget {
  const Aboutapppage({super.key});

  @override
  State<Aboutapppage> createState() => _AboutapppageState();
}

class _AboutapppageState extends State<Aboutapppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About App" ),
      backgroundColor: Color.fromARGB(255, 191, 236, 232),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Tentang Aplikasi", 
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold),),
          ),
          
          SizedBox(height: 25,),
          Center(
            child: Text("About My App", 
              style: TextStyle(
              fontSize: 20, 
              color: Color(0xff2f6b6a),
              fontWeight: FontWeight.bold),),
          ),
          Text("Copyright 2020-2025 My App Ltd.",
          style: TextStyle(
            color: const Color.fromARGB(255, 114, 114, 114),
            fontSize: 12,
          ),),
          SizedBox(height: 25,),

          Container(
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 191, 236, 232),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 120,
          width: 280,
          child: Center(                  
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My App",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff2f6b6a),
                  fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Aplikasi ini dibuat oleh saya",
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.black),),
                Text("version 1.1.0 (1.1.0)",
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.black),),
                    ],
                    ),
      ))],
            ),
           
          );
            
    
  }
}