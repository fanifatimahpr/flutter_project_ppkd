import 'package:flutter/material.dart';

class Dropdownpage extends StatefulWidget {
  const Dropdownpage({super.key});

  @override
  State<Dropdownpage> createState() => _DropdownpageState();
}

class _DropdownpageState extends State<Dropdownpage> {
  String? dropdownValue;
  final List<String> listProduk = ["Pakaian", "Makanan", "Elektronik"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Center(
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text("Kategori Produk", 
                      style: TextStyle(
                        fontSize: 25, 
                        fontWeight: FontWeight.bold),),
             ),
           ),
           SizedBox(height: 50,),

          DropdownButton(
            hint: Text("Pilih Kategori Produkmu"),
            value: dropdownValue,
            items: listProduk.map((String val){
              return DropdownMenuItem(
                value: val,
                child: Text(val, style: TextStyle(color: Colors.black),));
            }).toList(), 
            onChanged: (value){
              setState(() {
                dropdownValue = value;
              });
              print(dropdownValue);
            }),
        ],
      ),
    );
  }
}