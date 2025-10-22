import 'package:flutter/material.dart';

class SyaratketentuanPage extends StatefulWidget {
  const SyaratketentuanPage({super.key});

  @override
  State<SyaratketentuanPage> createState() => _SyaratketentuanPageState();
}

class _SyaratketentuanPageState extends State<SyaratketentuanPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Syarat & Ketentuan", 
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 25,),
          Center(
            child: Text("Welcome to My App", 
              style: TextStyle(
              fontSize: 20, 
              color: Color(0xff2f6b6a),
              fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 15,),

          Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 191, 236, 232),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            height: 120,
            width: 280,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text("Dengan menyetujui Syarat dan Ketentuan Aplikasi ini, Anda juga menyetujui Syarat dan Ketentuan tambahan",
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.black),),
              ),
            ),
          ),
            
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChecked, 
                onChanged: (value){
                  print(value);
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              Text("Saya menyetujui semua persyaratan yang berlaku",
              style: TextStyle(
                fontSize: 13
              ),),
            ],
          ),
          ElevatedButton(
            onPressed: _isChecked ? (){} : null,
            child: _isChecked ?  Text("Lanjutkan pendaftaran diperbolehkan") : Text("Anda belum bisa melanjutkan"),
            ),
        ]
            ),
      );
        
  }
}