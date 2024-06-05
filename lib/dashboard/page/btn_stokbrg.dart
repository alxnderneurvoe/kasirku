import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';

class BtnStokBarang extends StatefulWidget {
  const BtnStokBarang({super.key});

  @override
  State<BtnStokBarang> createState() => _BtnStokBarangState();
}

class _BtnStokBarangState extends State<BtnStokBarang> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              navToStokBrg(context);
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
                      Icon(Icons.view_quilt, color: bluebg, size: 80),
                      Text('Daftar Stok Barang',
                          style: TextStyle(color: bluebg, fontSize: 20))
                    ]))));
  }
}
