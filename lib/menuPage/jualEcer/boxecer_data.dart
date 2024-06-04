import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/color.dart';
import 'deleteecer.dart';

class BoxDataEcer extends StatefulWidget {
  const BoxDataEcer({super.key});

  @override
  State<BoxDataEcer> createState() => _BoxDataEcerState();
}

class _BoxDataEcerState extends State<BoxDataEcer> {
  TextEditingController namaUser = TextEditingController();
  TextEditingController jumlahbrg = TextEditingController();
  TextEditingController namabrg = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.width;
    double targetWidth = deviceHeight * 0.315;
    double targetWidth1 = deviceHeight * 0.64;
    double targetWidth2 = deviceHeight * 0.15;

    return Column(children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          height: 130,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tgl || Jam', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 60,
                                width: targetWidth,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: Text(
                                    DateFormat('dd-MM-yyyy || HH:mm')
                                        .format(selectedDate),
                                    style: TextStyle(fontSize: 19)))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kasir', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 60,
                                width: targetWidth,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: Text('Safrizal',
                                    style: TextStyle(fontSize: 19)))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pelanggan', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 60,
                                width: targetWidth,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: TextFormField(
                                    controller: namaUser,
                                    onChanged: _handleNamaText,
                                    style: TextStyle(fontSize: 19, height: 0),
                                    decoration: InputDecoration(
                                        labelText: 'Nama Pelanggan',
                                        labelStyle: TextStyle(fontSize: 19),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: InputBorder.none)))
                          ])
                    ])
              ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          height: 100,
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 60,
                width: targetWidth1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: TextFormField(
                    controller: namabrg,
                    style: TextStyle(fontSize: 19, height: 0),
                    decoration: InputDecoration(
                        labelText: 'Cari Barang',
                        labelStyle: TextStyle(fontSize: 19),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none))),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 60,
                width: targetWidth2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: TextFormField(
                    controller: jumlahbrg,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 19, height: 0),
                    decoration: InputDecoration(
                        labelText: 'Qty',
                        labelStyle: TextStyle(fontSize: 19),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none))),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 60,
                width: targetWidth2,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: GestureDetector(
                    onTap: _saveDataToFirestore,
                    child: Center(
                        child: Text('Add',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))))
          ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('List Barang Terinput', style: TextStyle(fontSize: 19)),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('transaksiecer')
                    .doc(namaUser.text)
                    .collection('orderan')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot booking =
                                  snapshot.data!.docs[index];
                              return Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    ListTile(
                                        title: Text(
                                          booking['a_nama_barang'],
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(booking['b_jumlah']),
                                            ]),
                                        trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  onPressed: () {
                                                    showDeleteConfirmationDialog(
                                                        context, booking);
                                                  })
                                            ]))
                                  ]));
                            }));
                  } else {
                    return Center(
                      child: Text('No items found.'),
                    );
                  }
                })
          ]))
    ]);
  }

  void _saveDataToFirestore() async {
    if (namaUser.text.isEmpty ||
        namabrg.text.isEmpty ||
        jumlahbrg.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please fill all fields.'),
          duration: Duration(seconds: 4)));
      return;
    }
    try {
      await _firestore
          .collection('transaksiecer')
          .doc(namaUser.text)
          .collection('orderan')
          .add(
        {'a_nama_barang': namabrg.text, 'b_jumlah': jumlahbrg.text},
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
    namaUser.value = namaUser.value.copyWith(
        text: sentenceCaseValue,
        selection: TextSelection.collapsed(offset: sentenceCaseValue.length));
  }
}
