import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'deleteecer.dart';

class BoxDataEcer extends StatefulWidget {
  const BoxDataEcer({super.key});

  @override
  State<BoxDataEcer> createState() => _BoxDataEcerState();
}

class _BoxDataEcerState extends State<BoxDataEcer> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController namabrg = TextEditingController();
  final TextEditingController jumlahbrg = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();

  String? selectedPelanggan;
  double totalBelanjaan = 0.0;
  double change = 0.0;
  DateTime selectedDate = DateTime.now();
  List<String> barangNames = [];

  @override
  void initState() {
    super.initState();
    _fetchNamaPelanggan();
    _fetchBarangNames();
  }

  @override
  void dispose() {
    _paymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double targetWidth1 = deviceWidth * 0.55;
    double targetWidth2 = deviceWidth * 0.15;
    double halfBox = deviceWidth * 0.43;

    return Column(children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
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
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          width: halfBox,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.grey.shade700)),
                          child: Text(
                              DateFormat('dd-MM-yyyy || HH:mm')
                                  .format(selectedDate),
                              style: TextStyle(fontSize: 15))),
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          height: 40,
                          width: halfBox,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.grey.shade700)),
                          child:
                              Text('Safrizal', style: TextStyle(fontSize: 15))),
                    ]),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 40,
                    width: deviceWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey.shade700)),
                    child: selectedPelanggan == null
                        ? CircularProgressIndicator()
                        : Text(selectedPelanggan!,
                            style: TextStyle(fontSize: 15))),
              ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 60,
          width: deviceWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ]),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: targetWidth1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                  return barangNames.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  }).toList();
                }, onSelected: (String selectedItem) {
                  setState(() {
                    namabrg.text = selectedItem;
                  });
                }, fieldViewBuilder: (context, textEditingController, focusNode,
                        onFieldSubmitted) {
                  textEditingController.text = namabrg.text;
                  return TextFormField(
                      textAlign: TextAlign.left,
                      controller: textEditingController,
                      style: TextStyle(fontSize: 15, height: 1.0),
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          hintText: 'Cari Barang',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                          border: InputBorder.none,
                          isDense: true),
                      onFieldSubmitted: (value) {
                        setState(() {
                          namabrg.text = value;
                        });
                      });
                })),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: targetWidth2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: jumlahbrg,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 15, height: 1.0),
                    decoration: InputDecoration(
                        hintText: 'Qty',
                        hintStyle: TextStyle(fontSize: 16),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                        border: InputBorder.none,
                        isDense: true))),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
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
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))))
          ])),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Text('List Barang Terinput',
                    style: TextStyle(fontSize: 16))),
            Divider(
              color: Colors.black45,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('transaksiecer')
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
                            itemCount: snapshot.data?.docs.length ?? 0,
                            itemBuilder: (context, index) {
                              DocumentSnapshot booking =
                                  snapshot.data!.docs[index];
                              var jumlah = booking['b_jumlah'];
                              var hargaEceran = booking['harga_eceran'];

                              if (jumlah is String) {
                                try {
                                  jumlah = int.parse(jumlah);
                                } catch (e) {
                                  print('Error parsing jumlah: $e');
                                  jumlah = 0;
                                }
                              } else if (jumlah is! int) {
                                jumlah = 0;
                              }

                              if (hargaEceran is String) {
                                try {
                                  hargaEceran = double.parse(hargaEceran);
                                } catch (e) {
                                  print('Error parsing hargaEceran: $e');
                                  hargaEceran = 0.0;
                                }
                              } else if (hargaEceran is! double) {
                                hargaEceran = hargaEceran?.toDouble() ?? 0.0;
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
                                                const TextStyle(fontSize: 16)),
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
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 102,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ]),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                width: halfBox,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: Text('Rp. $totalBelanjaan',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                width: halfBox,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border:
                                      Border.all(color: Colors.grey.shade700),
                                ),
                                child: Text(
                                  'Rp. $change',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                width: halfBox,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: Colors.grey.shade700)),
                                child: TextFormField(
                                    controller: _paymentController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      _calculateChange();
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Input Pembayaran',
                                        border: InputBorder.none),
                                    style: TextStyle(fontSize: 16))),
                            SizedBox(height: 10),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                width: halfBox,
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
                          ])
                        ])
                  ])))
    ]);
  }

  Future<void> _fetchNamaPelanggan() async {
    DocumentSnapshot snapshot = await _firestore
        .collection('namapelangganecer')
        .doc('namapelanggan')
        .get();
    setState(() {
      selectedPelanggan = snapshot['namapelanggan'];
    });
  }

  Future<void> _fetchBarangNames() async {
    QuerySnapshot snapshot =
        await _firestore.collection('stock').orderBy('namabarang').get();
    setState(() {
      barangNames =
          snapshot.docs.map((doc) => doc['namabarang'] as String).toList();
    });
  }

  void _calculateChange() {
    double payment = double.tryParse(_paymentController.text) ?? 0.0;
    setState(() {
      change = payment - totalBelanjaan;
    });
  }

  Future<void> _saveDataToFirestore() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('stock')
          .where('namabarang', isEqualTo: namabrg.text.trim())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var stockDoc = querySnapshot.docs.first;
        var hargaEceran = stockDoc['harga_eceran'];

        await _firestore.collection('transaksiecer').add({
          'a_nama_barang': namabrg.text.trim(),
          'b_jumlah': jumlahbrg.text.trim(),
          'harga_eceran': hargaEceran,
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: Barang not found in stock'),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (e) {}
  }

  void _calculateTotalBelanjaan(List<DocumentSnapshot> docs) {
    double total = 0.0;
    for (var doc in docs) {
      var jumlah = doc['b_jumlah'];
      var hargaEceran = doc['harga_eceran'];

      if (jumlah is int) {
        jumlah = jumlah.toDouble();
      } else if (jumlah is double) {
      } else if (jumlah is String) {
        try {
          jumlah = double.parse(jumlah);
        } catch (e) {
          print('Error parsing jumlah: $e');
          jumlah = 0.0;
        }
      } else {
        jumlah = 0.0;
      }

      if (hargaEceran is double) {
      } else if (hargaEceran is int) {
        hargaEceran = hargaEceran.toDouble();
      } else if (hargaEceran is String) {
        try {
          hargaEceran = double.parse(hargaEceran);
        } catch (e) {
          print('Error parsing hargaEceran: $e');
          hargaEceran = 0.0;
        }
      } else {
        hargaEceran = 0.0;
      }

      total += jumlah * hargaEceran;
    }
    setState(() {
      totalBelanjaan = total;
    });
  }
}
