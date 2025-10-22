import 'package:flutter/material.dart';

class listviewDay17 extends StatefulWidget {
  const listviewDay17({super.key});

  @override
  State<listviewDay17> createState() => _listviewDay17State();
}

class _listviewDay17State extends State<listviewDay17> {
  final List<String> namaATK = [
    "Pulpen", 
    "Pensil", 
    "Penghapus", 
    "Buku", 
    "Paper Clip", 
    "Kalkulator", 
    "Penggaris", 
    "Map Folder", 
    "Gunting", 
    "Cutter"
    ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaATK.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(namaATK[index]));
      },


    );
  }
}