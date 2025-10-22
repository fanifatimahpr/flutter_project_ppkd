import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/imageasset.dart';

class Listviewmap extends StatefulWidget {
  const Listviewmap({super.key});

  @override
  State<Listviewmap> createState() => _ListviewmapState();
}

class _ListviewmapState extends State<Listviewmap> {
  final List<Map<String, dynamic>> namaATK = [
    {
      "name": "Pulpen",
      "price": 3000,
      "image": AppImage.Pulpen,
    },
    {
      "name": "Pensil",
      "price": 1500,
      "image": AppImage.Pensil,
    },
    {
      "name": "Penghapus",
      "price": 2500,
      "image": AppImage.Penghapus,
    },
    {
      "name": "Buku",
      "price": 7000,
      "image": AppImage.Buku,
    },
    {
      "name": "Paper Clip",
      "price": 5000,
      "image": AppImage.PaperClip,
    },
    {
      "name": "Kalkulator",
      "price": 25000,
      "image": AppImage.Kalkulator,
    },
    {
      "name": "Penggaris",
      "price": 4000,
      "image": AppImage.Penggaris,
    },
    {
      "name": "Map Folder",
      "price": 3000,
      "image": AppImage.mapfolder,
    },
    {
      "name": "Gunting",
      "price": 6000,
      "image": AppImage.Gunting,
    },
    {
      "name": "Cutter",
      "price": 8000,
      "image": AppImage.Cutter,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaATK.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaATK[index];
        return ListTile(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color.fromARGB(255, 191, 236, 232),
                content: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
          leading: Image.asset(item["image"], width: 60),
          title: Text(item["name"]),
          subtitle: Text(item["price"].toString().toRPCurrency()),
      
        );
  },
  );
  }
}