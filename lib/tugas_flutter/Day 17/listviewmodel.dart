import 'package:flutter/material.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/classaksesoris.dart';
import 'package:flutter_project_ppkd/tugas_flutter/Day%2017/imageasset.dart';

class Listviewmodel extends StatefulWidget {
  const Listviewmodel({super.key});

  @override
  State<Listviewmodel> createState() => _ListviewmodelState();
}

class _ListviewmodelState extends State<Listviewmodel> {
  final List<ATKModel> namaATK = [
    ATKModel(
      name: "Pulpen",
      price: 3000,
      image: AppImage.Pulpen, backgroundColor: Color.fromARGB(255, 191, 236, 232)),
      
    ATKModel(
      name: "Pensil",
      price: 1500,
      image: AppImage.Pensil, backgroundColor: Color.fromARGB(255, 137, 189, 184)),
    ATKModel(
      name: "Penghapus",
      price: 2500,
      image: AppImage.Penghapus, backgroundColor: Color.fromARGB(255, 191, 236, 232)),
    ATKModel(
      name: "Buku",
      price: 7000,
      image: AppImage.Buku, backgroundColor: Color.fromARGB(255, 137, 189, 184)) ,
    ATKModel(
      name: "Paper Clip",
      price: 5000,
      image: AppImage.PaperClip, backgroundColor: Color.fromARGB(255, 191, 236, 232)),
    ATKModel(
      name: "Kalkulator",
      price: 25000,
      image: AppImage.Kalkulator, backgroundColor: Color.fromARGB(255, 137, 189, 184)),
    ATKModel(
      name: "Penggaris",
      price: 4000,
      image: AppImage.Penggaris, backgroundColor: Color.fromARGB(255, 191, 236, 232)),
    ATKModel(
      name: "Map Folder",
      price: 3000,
      image: AppImage.mapfolder, backgroundColor: Color.fromARGB(255, 137, 189, 184)),
    ATKModel(
      name: "Gunting",
      price: 6000,
      image: AppImage.Gunting, backgroundColor: Color.fromARGB(255, 191, 236, 232)),
    ATKModel(
      name: "Cutter",
      price: 8000,
      image: AppImage.Cutter, backgroundColor: Color.fromARGB(255, 137, 189, 184)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaATK.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaATK[index];
        return ListTile(
          onTap: () {},
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
  },
  );
  }
}