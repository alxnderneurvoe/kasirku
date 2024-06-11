import 'package:flutter/material.dart';
import '/model/color.dart';
import 'boxgrosir_data.dart';


class JualGrosir extends StatefulWidget {
  JualGrosir({super.key});

  @override
  State<JualGrosir> createState() => _JualGrosirState();
}

class _JualGrosirState extends State<JualGrosir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: bluebg,
            title: Text('Transaksi Grosir',
                style: TextStyle(fontSize: 17, color: Colors.white)),
            centerTitle: true),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              BoxDataGrosir(),
            ])));
  }
}
