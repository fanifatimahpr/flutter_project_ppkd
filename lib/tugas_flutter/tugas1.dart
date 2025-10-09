import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 192, 216, 228),
      appBar: AppBar(title: Text("Profil Saya"), backgroundColor: Colors.blue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hello,",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
          Text("I'm Fani Fatimah Praktika",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          ),

        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on), Text("Jakarta", style: TextStyle(fontSize: 16),)],
              ),
            
             
          Text("Saya adalah seorang Freshgraduate yang sedang mempelajari Flutter di kelas Mobile Programming PPKD Jakpus Batch 4",  
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:14,
            fontFamily: "Helvetica"),
          
          
          )
        ],
      ),
    );
  }
}