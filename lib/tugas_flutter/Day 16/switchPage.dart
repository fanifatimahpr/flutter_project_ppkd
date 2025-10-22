import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Switchpage extends StatefulWidget {
  const Switchpage({super.key});

  @override
  State<Switchpage> createState() => _SwitchpageState();
}

class _SwitchpageState extends State<Switchpage> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isSwitched? Colors.black : CupertinoColors.extraLightBackgroundGray,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Mode Gelap", 
                      style: TextStyle(
                        color: _isSwitched? Color.fromARGB(255, 191, 236, 232) : Colors.black,
                        fontSize: 25, 
                        fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: 50,),
          Switch(
            value: _isSwitched, 
            onChanged: (value){
              setState(() {
                _isSwitched = value;
              });
            }),
            Text(_isSwitched ? "Mode Gelap Aktif" : "Mode Terang Aktif",
            style: TextStyle(
              color: _isSwitched? Color.fromARGB(255, 191, 236, 232) : Colors.black,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    );
  }
}