
import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/homeScreen.dart';
import 'package:flutter_project_ppkd/tugas_flutter/textTestWidget.dart';

class Tugas6 extends StatefulWidget {
  const Tugas6({super.key});

  @override
  State<Tugas6> createState() => _Tugas6State();
}

class _Tugas6State extends State<Tugas6> {
  bool clickEye = true;
  bool obscurepass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        
        //Header
        children: [
          Container(
            height: 186,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/orangefruit2.jpg"),
                fit: BoxFit.fitWidth)
            ),
            
            ),
          
          SizedBox(height: 30,),

          //Text Login Account
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
      
                Text("Login Account", 
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 15,),

          //Text Subtitle
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Hello, you must login first to be able to use the application and enjoy all the features in Calashop",
            style: TextStyle(
              fontSize: 14,
              color: const Color.fromARGB(255, 97, 97, 97)),),
          ),

          SizedBox(height: 30,),

          //Email Adress dan Password
          Row(
            children: [
              Padding(padding: EdgeInsets.all(10.0)),
              //Reusable Text
              textTest(text:"Email Adress" ,),],),
                SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText: "Example@gmail.com",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
              //Reusable Text
              textTest(text: "Password")
              ],),
                SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextField(obscureText: obscurepass,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      clickEye = !clickEye;
                      setState(() {
                        obscurepass = !obscurepass;
                      });
                    }, 
                    icon: Icon(obscurepass ? Icons.visibility_outlined : Icons.visibility_off_outlined)
                    ),
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            
          //Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){}, 
                child: Text("Forgot Password?",
                textAlign: TextAlign.right,
                  style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold),
                  )),
            ],
          ), 
          SizedBox(height: 10,),

          //Sign In
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xfff8623a)),
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homescreen()),
                );
            }, 
            child: SizedBox(
              width: 300,
              height: 50,
              child: Center(
                child: Text("Sign In",
                  style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
                  ),
              ),
            )),
          SizedBox(height: 25,),

          //Or Sign In With
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(thickness: 1,),
                )),
            Text("Or Sign In With",
          style: TextStyle(
            fontSize: 13, 
            color: const Color.fromARGB(255, 97, 97, 97)
            ),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 1,),
            )),
            ],
          ),
          
          SizedBox(height: 10,),

          //Google dan Facebook
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 247, 247)),
                    onPressed: (){}, 
                    child: SizedBox(
                      height: 50,
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google2.png", height: 40, width: 40,),                 
                          Text("Google",style: TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 247, 247)),
                    onPressed: (){}, 
                    child: Container(
                      height: 50,
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,            
                        children: [
                          Image.asset("assets/images/facebook2.png", height: 30, width: 30,),
                          SizedBox(width: 5,),
                          Text("Facebook",style: TextStyle(fontSize: 14, color: Colors.black),),
                        ],
                      ),
                    )),
                ),
              ),
            ],
          ),

          //Dont Have Account
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("Don't have an account?",
                style: TextStyle(
                  fontSize: 12, 
                  color: const Color.fromARGB(255, 97, 97, 97)),
                ),
                TextButton(
                onPressed: (){}, 
                child: Text("Join Us",
                  style: TextStyle(
                  fontSize: 12,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold),
                )), 
              ],
            ),
          ),
          ],
      ),
    );
  }
}
