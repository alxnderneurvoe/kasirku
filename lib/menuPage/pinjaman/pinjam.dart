import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';
import 'pinjam_list.dart';

class PinjamanPage extends StatefulWidget {
  @override
  State<PinjamanPage> createState() => _PinjamanPageState();
}

class _PinjamanPageState extends State<PinjamanPage> {
  String? selectedPeminjam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: bluebg,
          title: Text('Pinjaman List'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 40),
                onPressed: () {
                  navToAddPinjaman(context);
                })
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedPeminjam,
              hint: Text('Filter by Nama Peminjam'),
              items: ["Safrizal", "Ikhsan", "Andre"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPeminjam = newValue;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.filter_list),
              ),
            ),
          ),
          Expanded(child: PinjamanList(searchQuery: selectedPeminjam)),
        ],
      ),
    );
  }
}
