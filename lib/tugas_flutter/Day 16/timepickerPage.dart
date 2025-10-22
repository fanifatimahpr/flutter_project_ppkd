import 'package:flutter/material.dart';

class Timepickerpage extends StatefulWidget {
  const Timepickerpage({super.key});

  @override
  State<Timepickerpage> createState() => _TimepickerpageState();
}

class _TimepickerpageState extends State<Timepickerpage> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Waktu Pengingat", 
                      style: TextStyle(
                        fontSize: 25, 
                        fontWeight: FontWeight.bold),),
            ),
           
          ),
          SizedBox(height: 50,),

          Container(
            height: 70,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 191, 236, 232),
                borderRadius: BorderRadius.all(Radius.circular(18))
              ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Pengingat diatur pada:"),
                  Text(
                selectedTime != null? selectedTime!.format(context) : "Belum dipilih",
              ),
                ],
              ),
          ),
            SizedBox(height: 20,),

          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context, 
                initialTime: TimeOfDay.now());
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedTime = picked;
                });
              }
            }, 
            child: Text("Pilih Waktu Pengingat"),
            ),
            SizedBox(height:25),
            
            

        ],

      ),
    );
  }
}