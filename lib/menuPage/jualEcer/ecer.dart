import 'package:flutter/material.dart';
import 'package:kasirku/model/nav.dart';
import '/model/color.dart';

import 'boxecer_data.dart';
// import 'boxecer_list.dart';

class JualEcer extends StatefulWidget {
  const JualEcer({super.key});

  @override
  State<JualEcer> createState() => _JualEcerState();
}

class _JualEcerState extends State<JualEcer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: bluebg,
            title: Text('Transaksi Eceran',
                style: TextStyle(fontSize: 17, color: Colors.white)),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    navToJualEcer(context);
                  })
            ]),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              BoxDataEcer(),
              // BoxListEcer(),
            ])));
  }
}
