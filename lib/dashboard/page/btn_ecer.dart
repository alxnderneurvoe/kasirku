import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';

class BtnEcer extends StatefulWidget {
  const BtnEcer({super.key});

  @override
  State<BtnEcer> createState() => _BtnEcerState();
}

class _BtnEcerState extends State<BtnEcer> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController customerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              _showCustomerNameDialog(context);
            },
            child: Container(
                width: double.infinity,
                height: 130,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_basket_outlined,
                          color: bluebg, size: 50),
                      Text('Jual Eceran',
                          style: TextStyle(color: bluebg, fontSize: 17))
                    ]))));
  }

  void _showCustomerNameDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Masukkan Nama Pelanggan', style: TextStyle(fontSize: 15),),
              content: TextField(
                  controller: customerNameController,
                  onChanged: _handleNamaText,
                  decoration: InputDecoration(hintText: "Nama Pelanggan")),
              actions: <Widget>[
                TextButton(
                    child: Text('Batal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      String customerName = customerNameController.text;
                      if (customerName.isNotEmpty) {
                        Navigator.of(context).pop();
                        _saveDataToFirestore();
                        navToJualEcer(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Nama Pelanggan tidak boleh kosong')));
                      }
                    })
              ]);
        });
  }

  void _saveDataToFirestore() async {
    try {
      await _firestore
          .collection('namapelanggan')
          .doc('namapelanggan')
          .set({'namapelanggan': customerNameController.text});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration successfully'),
          duration: Duration(seconds: 4)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), duration: Duration(seconds: 4)));
    }
  }

  void _handleNamaText(String value) {
    String sentenceCaseValue = value.toLowerCase();
    List<String> words = sentenceCaseValue.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    sentenceCaseValue = words.join(' ');
    customerNameController.value = customerNameController.value.copyWith(
        text: sentenceCaseValue,
        selection: TextSelection.collapsed(offset: sentenceCaseValue.length));
  }
}
