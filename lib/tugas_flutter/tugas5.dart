import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showName = true;
  bool clickButton = true;
  bool showFullText = true;
  double counter = 0;
  bool clickBox = true;
  int angka = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button")),
      body: Column(
         
         //Elevated Button (Tampilan Nama)
         children: [
          if(showName) ...[
            Center(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 214, 230, 200), borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Center(
                  child: Text("Fani Fatimah Praktika", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ]
          else ... [],

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 219, 236, 207)),
              onPressed: () {
                print("Tampilkan Nama: $showName");
                showName = !showName;
                setState(() {});
              },
              child: Text(showName ? "Tampilkan Nama" : "Sembunyikan Nama", style: TextStyle(color: const Color.fromARGB(255, 49, 48, 43)),),
            ),
          ),
        
        SizedBox(height: 15,),
        
        
        //IconButton
        Padding(padding: const EdgeInsets.all(10.0),
        child: IconButton(
          onPressed: () {
            clickButton = !clickButton;
            setState(() {});
          },
          icon: Icon(clickButton ? Icons.favorite : Icons.favorite_border_outlined),
        ),
        ),
        Center(child: clickButton ? Text("Like", style: TextStyle(fontSize: 16)) : Text("Dislike", style: TextStyle(fontSize: 16)),
        ),
        
        SizedBox(height: 15,),
         
         
        //TextButton
        if(showName) ...[
            Center(
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 200, 232, 236), borderRadius: BorderRadius.all(Radius.circular(24))),
                
                child: Center 
                (child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Saya sedang mempelajari Flutter di kelas Mobile Programming PPKD Jakpus", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                ))),
              ),
          ]
          else ... [],

          Center(
            child: TextButton(
              onPressed: () {
                print("Tampilkan Nama: $showFullText");
                showFullText = !showFullText;
                setState(() {});
              },
              child: Text(showFullText ? "Tampilkan Deskripsi" : "Sembunyikan Deskripsi", style: TextStyle(color: const Color.fromARGB(255, 49, 48, 43)),),
            ),
          ),

         SizedBox(height: 15,),


        //FloatingActionButton
        Text(
          counter.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        FloatingActionButton(onPressed: (){
          counter--;
          setState(() {   
          });
        },
        child: Icon(Icons.add),),

        SizedBox(height: 15,),


        //Inkwell
        Container(
          height: 65,
          decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 195, 195),
                borderRadius: BorderRadius.circular(18),
              ),
          child: InkWell(
            splashColor: Colors.amber,
            onTap: () {
              print("Kotak Disentuh");
              clickBox = !clickBox;
              setState(() {});
            },
            child: Center(child: clickBox ? Text("") : Text("Sentuh Kotak")),
            ),
          ),

          SizedBox(height: 15,),

          //Gesture Detector
          Container(
            height: 65,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 195, 195),
                borderRadius: BorderRadius.circular(18),
              ),
            child: GestureDetector(
              onTap: () {
                angka++;
                setState(() {
                });
                print("Ditekan Sekali = $angka");
              },
              onDoubleTap: () {
                angka+=2;
                setState(() {
                });
                print("Ditekan dua kali = $angka");
              },
              onLongPress: () {
                angka+=3;
                setState(() {
                });
                print("Ditekan lama = $angka");
              },
              child: Center(child: Text("Click Here")),
            ),
          )
          ],
        

        ),
        );     
  }
}