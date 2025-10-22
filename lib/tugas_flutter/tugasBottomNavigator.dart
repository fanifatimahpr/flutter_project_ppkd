
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugas3.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugas4.dart';
import 'package:flutter_project_ppkd/tugas_flutter/tugas5.dart';

class Tugasbottomnavigator extends StatefulWidget {
  const Tugasbottomnavigator({super.key});

  @override
  State<Tugasbottomnavigator> createState() => _tugasBottomNavigatorState();
}

class _tugasBottomNavigatorState extends State<Tugasbottomnavigator> {
  bool clickEye = true;
  bool obscurepass = true;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget> [
    Tugas3(),
    Tugas4(),
    Tugas5(),
  ];

  void _onItemTapped(int Index){
    setState(() {
      _selectedIndex = Index;
    });
  Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //Bottom Navigator
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"),
        ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
      ),
      

        //Header
          // Container(
          //   height: 186,
          //   width: 400,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/orangefruit2.jpg"),
          //       fit: BoxFit.fitWidth)
          //   ),
            
          //   ),
          
          // SizedBox(height: 30,),

          //Text Login Account
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     children: [
      
          //       Text("Login Account", 
          //       style: TextStyle(
          //         fontSize: 24, 
          //         fontWeight: FontWeight.bold),),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 15,),

          // //Text Subtitle
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Text("Hello, you must login first to be able to use the application and enjoy all the features in Calashop",
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: const Color.fromARGB(255, 97, 97, 97)),),
          // ),

          // SizedBox(height: 30,),

          // //Email Adress dan Password
          // Row(
          //   children: [
          //     Padding(padding: EdgeInsets.all(10.0)),
          //     //Reusable Text
          //     textTest(text:"Email Adress" ,),],),
          //       SizedBox(height: 15,),
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 22.0),
          //     child: TextField(
          //       decoration: InputDecoration(
          //         contentPadding: EdgeInsets.all(10.0),
          //         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
          //         hintText: "Example@gmail.com",
          //         hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       ),
          //     ),
          //   ),
          // SizedBox(height: 20,),
          // Row(
          //   children: [
          //     Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          //     //Reusable Text
          //     textTest(text: "Password")
          //     ],),
          //       SizedBox(height: 15,),
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 22.0),
          //     child: TextField(obscureText: obscurepass,
          //       decoration: InputDecoration(
          //         suffixIcon: IconButton(
          //           onPressed: (){
          //             clickEye = !clickEye;
          //             setState(() {
          //               obscurepass = !obscurepass;
          //             });
          //           }, 
          //           icon: Icon(obscurepass ? Icons.visibility_outlined : Icons.visibility_off_outlined)
          //           ),
          //         contentPadding: EdgeInsets.all(10.0),
          //         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
          //         hintText: "Password",
          //         hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          //       ),
          //     ),
          //   ),
            
          // //Forgot Password
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TextButton(
          //       onPressed: (){}, 
          //       child: Text("Forgot Password?",
          //       textAlign: TextAlign.right,
          //         style: TextStyle(
          //         fontSize: 14,
          //         color: Colors.deepOrangeAccent,
          //         fontWeight: FontWeight.bold),
          //         )),
          //   ],
          // ), 
          // SizedBox(height: 10,),

          // //Sign In
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Color(0xfff8623a)),
          //   onPressed: (){
          //     Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => Homescreen()),
          //       );
          //   }, 
          //   child: SizedBox(
          //     width: 300,
          //     height: 50,
          //     child: Center(
          //       child: Text("Sign In",
          //         style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold),
          //         ),
          //     ),
          //   )),
          // SizedBox(height: 25,),

         
      );
  }
}
