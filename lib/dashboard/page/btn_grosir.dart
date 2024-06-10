import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';

class BtnGrosir extends StatefulWidget {
  const BtnGrosir({super.key});

  @override
  State<BtnGrosir> createState() => _BtnGrosirState();
}

class _BtnGrosirState extends State<BtnGrosir> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              navToJualGrosir(context);
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
                      Icon(Icons.add_shopping_cart_sharp,
                          color: bluebg, size: 50),
                      Text('Jual Grosir',
                          style: TextStyle(color: bluebg, fontSize: 17))
                    ]))));
  }
}
