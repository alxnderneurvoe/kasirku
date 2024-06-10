import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/color.dart';

class AddPinjamanPage extends StatefulWidget {
  @override
  State<AddPinjamanPage> createState() => _AddPinjamanPageState();
}

class _AddPinjamanPageState extends State<AddPinjamanPage> {
  final TextEditingController jumlahPinjaman = TextEditingController();
  final TextEditingController inputkeperluan = TextEditingController();

  String? selectedpeminjam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: bluebg,
            title: Text('Form Peminjaman'),
            centerTitle: true),
        body: Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: bluebg.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text('Nama Peminjam',
                            style: TextStyle(fontSize: 15))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text('Jumlah Pinjam',
                            style: TextStyle(fontSize: 15))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Keperluan', style: TextStyle(fontSize: 15)))
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text(' :  ', style: TextStyle(fontSize: 18))),
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text(' :  ', style: TextStyle(fontSize: 18))),
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text(' :  ', style: TextStyle(fontSize: 18)))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 60,
                    width: 210,
                    child: DropdownButtonFormField(
                      value: selectedpeminjam,
                      alignment: Alignment.bottomCenter,
                      items: ["Safrizal", "Ikhsan", "Andre"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedpeminjam = value ?? "";
                        });
                      },
                      decoration:
                          const InputDecoration(border: UnderlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                      height: 60,
                      width: 210,
                      child: TextFormField(
                        controller: jumlahPinjaman,
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                      height: 60,
                      width: 210,
                      child: TextFormField(
                        controller: inputkeperluan,
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                      ))
                ])
              ]),
              Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey.shade700)),
                  child: GestureDetector(
                      onTap: () {
                        _addStock(context);
                      },
                      child: Center(
                          child: Text('Add',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))))
            ],
          ),
        ));
  }

  void _addStock(BuildContext context) async {
    try {
      int quantity = int.parse(jumlahPinjaman.text.trim());

      if (quantity > 0) {
        await FirebaseFirestore.instance.collection('pinjaman').add({
          'tanggal_pinjaman': DateTime.now(),
          'nama_peminjam': selectedpeminjam,
          'jumlah_pinjaman': quantity,
          'keperluan': inputkeperluan
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration successfully'),
          duration: Duration(seconds: 4),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please enter valid data.'),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print('Error adding stock: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred. Please try again later.'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
