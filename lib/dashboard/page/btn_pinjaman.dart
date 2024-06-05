import 'package:flutter/material.dart';

import '../../model/color.dart';

class BtnPinjaman extends StatefulWidget {
  const BtnPinjaman({super.key});

  @override
  State<BtnPinjaman> createState() => _BtnPinjamanState();
}

class _BtnPinjamanState extends State<BtnPinjaman> {
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
                      Icon(Icons.person_outline_sharp, color: bluebg, size: 80),
                      Text('Setting', style: TextStyle(color: bluebg, fontSize: 20))
                    ]))));
  }
}
