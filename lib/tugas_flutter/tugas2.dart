import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Lengkap"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //Baris 1: Center Text
        children: [
          const Center(
          child: Text("Fani Fatimah Praktika",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
        
        //Baris 2: Padding
        Padding(padding: const EdgeInsets.all(22.0),
        child: Container(
          color: CupertinoColors.secondarySystemFill,
        child: Row(
          children: [
            Icon(Icons.email),
            SizedBox(width: 8),
            Text("fanifatimahpr@gmail.com"),
          ],
        ),
        ),
        ),

        //Baris 3
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.phone),
            Spacer(),
            Text("0812-3456-7890"),
          ],
        ),),
        
        //Baris 4
        Row(
          children: [
            Expanded(child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.secondarySystemFill,
                borderRadius: BorderRadius.all(Radius.circular(22))
              ),
              height: 180,
              child: Padding(padding: const EdgeInsets.all(40),
              child: Padding(padding: const EdgeInsets.all(10),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("20", style: TextStyle(fontSize: 24),),
                Text("Postingan"),
              ],
              ),
              ),
              ),
            ),),
            Expanded(child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(22))
              ),
              height: 180,
              child: Padding(padding: const EdgeInsets.all(40),
              child: Padding(padding: const EdgeInsets.all(10),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1000", style: TextStyle(fontSize: 24),),
                Text("Followers"),
              ],),),),
              )),
          ],
        ),
        


        //Baris 5
        SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Saya adalah peserta pelatihan Mobile Programming di PPKD Jakarta Pusat.", textAlign: TextAlign.center,)
            ],
          ),),
          
        
        //Baris 6
        SizedBox(
          height: 40),
          Container(height: 50,
          color: CupertinoColors.quaternarySystemFill,
          alignment: Alignment.center,
          child: 
          Text("Let's Connect!",style: TextStyle(fontSize: 16, color: CupertinoColors.black),
      )
      )
          ]
      ),
    );
    
  }
}