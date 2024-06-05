import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/color.dart';

class AddStockPage extends StatelessWidget {
  final TextEditingController namabrg = TextEditingController();
  final TextEditingController jumlahbrg = TextEditingController();
  final TextEditingController pricegrosir = TextEditingController();
  final TextEditingController priceeceran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: bluebg,
            title: Text('Add Stock Barang'),
            centerTitle: true),
        body: Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 200, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          height: 500,
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
                        child: Text('Nama Barang',
                            style: TextStyle(fontSize: 18))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text('Jumlah Barang',
                            style: TextStyle(fontSize: 18))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text('Harga Grosir',
                            style: TextStyle(fontSize: 18))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text('Harga Eceran',
                            style: TextStyle(fontSize: 18))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        child: Text(' :  ', style: TextStyle(fontSize: 18))),
                    Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        child: Text(' :  ', style: TextStyle(fontSize: 18))),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      height: 60,
                      width: 635,
                      child: TextFormField(controller: namabrg)),
                  Container(
                      height: 60,
                      width: 635,
                      child: TextFormField(
                          controller: jumlahbrg,
                          keyboardType: TextInputType.number)),
                  Container(
                      height: 60,
                      width: 635,
                      child: TextFormField(
                          controller: pricegrosir,
                          keyboardType: TextInputType.number)),
                  Container(
                      height: 60,
                      width: 635,
                      child: TextFormField(
                          controller: priceeceran,
                          keyboardType: TextInputType.number))
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
      String nama = namabrg.text.trim();
      int quantity = int.parse(jumlahbrg.text.trim());
      int grosir = int.parse(pricegrosir.text.trim());
      int eceran = int.parse(priceeceran.text.trim());

      if (nama.isNotEmpty && quantity > 0) {
        await FirebaseFirestore.instance.collection('stock').add({
          'namabarang': nama,
          'jumlahstok': quantity,
          'harga_grosir': grosir,
          'harga_eceran': eceran
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
