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
  List<DocumentSnapshot> searchResults = [];

  String? selectedBarang;
  double totalBelanjaan = 0.0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot> _fetchNamaPelanggan() async {
    return await FirebaseFirestore.instance
        .collection('namapelanggan')
        .doc('namapelanggan')
        .get();
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.width;
    double targetWidth = deviceHeight * 0.315;
    double targetWidth1 = deviceHeight * 0.64;
    double targetWidth2 = deviceHeight * 0.15;
    double widthTotal = deviceHeight * 0.26;

    return SingleChildScrollView(
        child: Column(children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          height: 102,
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
                                height: 50,
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
                                height: 50,
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
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 50,
                                width: targetWidth,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: FutureBuilder<DocumentSnapshot>(
                                    future: _fetchNamaPelanggan(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else if (snapshot.hasData) {
                                        var data = snapshot.data!.data()
                                            as Map<String, dynamic>;
                                        return Text('${data['namapelanggan']}',
                                            style: TextStyle(fontSize: 19));
                                      } else {
                                        return Text('No Data',
                                            style: TextStyle(fontSize: 19));
                                      }
                                    }))
                          ])
                    ])
              ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          height: 70,
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
                height: 50,
                width: targetWidth1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('stock').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<String> barangNames = [];
                        for (var doc in snapshot.data!.docs) {
                          barangNames.add(doc['namabarang']);
                        }
                        return Autocomplete<String>(optionsBuilder:
                            (TextEditingValue textEditingValue) {
                          return barangNames.where((String option) {
                            return option
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        }, onSelected: (String selectedItem) {
                          setState(() {
                            namabrg.text = selectedItem;
                          });
                        }, fieldViewBuilder: (context, textEditingController,
                            focusNode, onFieldSubmitted) {
                          return TextFormField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                  labelText: 'Cari Barang',
                                  labelStyle: TextStyle(fontSize: 19),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: InputBorder.none));
                        });
                      } else {
                        return Text('No Data', style: TextStyle(fontSize: 19));
                      }
                    })),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 50,
                width: targetWidth2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: Center(
                  child: TextFormField(
                      controller: jumlahbrg,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 19, height: 0),
                      decoration: InputDecoration(
                          labelText: 'Qty',
                          labelStyle: TextStyle(fontSize: 19),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none)),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 50,
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
          height: MediaQuery.of(context).size.height * 0.5,
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
                    .doc('namabarang')
                    .collection('namabarang')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _calculateTotalBelanjaan(snapshot.data!.docs);
                    });

                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot booking =
                                  snapshot.data!.docs[index];

                              var jumlah = booking['b_jumlah'];
                              var hargaEceran = booking['harga_eceran'];

                              if (jumlah is String) {
                                jumlah = int.parse(jumlah);
                              }
                              if (hargaEceran is String) {
                                hargaEceran = double.parse(hargaEceran);
                              }

                              var total = jumlah * hargaEceran;

                              return Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    ListTile(
                                        title: Text(booking['a_nama_barang'],
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        subtitle: Row(children: [
                                          Text(jumlah.toString()),
                                          Text(' X '),
                                          Text(hargaEceran.toString()),
                                          Text(' = '),
                                          Text('Rp. ${total.toString()}')
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
                    return Container();
                  }
                })
          ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.all(10),
          height: 102,
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
                            Text('Total Belanjaan',
                                style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              height: 50,
                              width: widthTotal,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border:
                                      Border.all(color: Colors.grey.shade700)),
                              child: Text('Rp. $totalBelanjaan',
                                  style: TextStyle(fontSize: 19)),
                            )
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pembayaran', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 50,
                                width: widthTotal,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: Text('', style: TextStyle(fontSize: 19)))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kembalian', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 50,
                                width: widthTotal,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: Text(''))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('', style: TextStyle(fontSize: 19)),
                            SizedBox(height: 5),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 50,
                                width: targetWidth2,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: GestureDetector(
                                    onTap: _saveDataToFirestore,
                                    child: Center(
                                        child: Text('Print',
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)))))
                          ]),
                    ])
              ])),
    ]));
  }

  void _saveDataToFirestore() async {
    try {
      // Fetch the harga_eceran from the stock collection
      DocumentSnapshot stockDoc =
          await _firestore.collection('stock').doc(namabrg.text).get();

      if (stockDoc.exists) {
        var hargaEceran = stockDoc['harga_eceran'];

        // Save the data to the transaksiecer collection
        await _firestore
            .collection('transaksiecer')
            .doc('namabarang')
            .collection('namabarang')
            .add({
          'a_nama_barang': namabrg.text,
          'b_jumlah': jumlahbrg.text,
          'harga_eceran': hargaEceran,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration successfully'),
          duration: Duration(seconds: 4),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: Barang not found in stock'),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  void _calculateTotalBelanjaan(List<DocumentSnapshot> docs) {
    double total = 0.0;

    for (var doc in docs) {
      var jumlah = doc['b_jumlah'];
      var hargaEceran = doc['harga_eceran'];

      if (jumlah is String) {
        jumlah = int.parse(jumlah);
      }
      if (hargaEceran is String) {
        hargaEceran = double.parse(hargaEceran);
      }

      total += jumlah * hargaEceran;
    }

    setState(() {
      totalBelanjaan = total;
    });
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
      selection: TextSelection.collapsed(offset: sentenceCaseValue.length),
    );
  }
}
