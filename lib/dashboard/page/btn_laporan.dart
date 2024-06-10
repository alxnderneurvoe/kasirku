import 'package:flutter/material.dart';

import '../../model/color.dart';

class BtnLaporan extends StatefulWidget {
  const BtnLaporan({super.key});

  @override
  State<BtnLaporan> createState() => _BtnLaporanState();
}

class _BtnLaporanState extends State<BtnLaporan> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              // navToLaporan(context);
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
                      Icon(Icons.bar_chart_outlined, color: bluebg, size: 50),
                      Text('Laporan',
                          style: TextStyle(color: bluebg, fontSize: 17))
                    ]))));
  }
}
