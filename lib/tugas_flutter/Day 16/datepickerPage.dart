import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepickerpage extends StatefulWidget {
  const Datepickerpage({super.key});

  @override
  State<Datepickerpage> createState() => _DatepickerpageState();
}

class _DatepickerpageState extends State<Datepickerpage> {
  DateTime? selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Tanggal Lahir", 
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 50,),

          Center(
            child: Container(
              height: 70,
              width: 130,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 191, 236, 232),
                borderRadius: BorderRadius.all(Radius.circular(18))
              ),
              child: Center(
                child: Text(DateFormat('dd-MM-yyyy').format(selectedDate!),
                style: TextStyle(
                  fontSize: 16, 
                  color:Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
          SizedBox(height: 20,),
  
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context, 
                firstDate: DateTime(2000), 
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Text("Pilih Tanggal Lahir"),
      ), 
    ]));
    
  }
}