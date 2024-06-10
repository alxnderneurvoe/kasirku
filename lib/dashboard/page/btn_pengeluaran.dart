import 'package:flutter/material.dart';

import '../../model/color.dart';

class BtnPengeluaran extends StatefulWidget {
  const BtnPengeluaran({super.key});

  @override
  State<BtnPengeluaran> createState() => _BtnPengeluaranState();
}

class _BtnPengeluaranState extends State<BtnPengeluaran> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {},
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
                      Icon(Icons.receipt_long, color: bluebg, size: 50,),
                      Text('Pengeluaran', style: TextStyle(color: bluebg, fontSize: 17))
                    ]))));
  }
}
