import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/color.dart';

class BoxDataEcer extends StatefulWidget {
  const BoxDataEcer({super.key});

  @override
  State<BoxDataEcer> createState() => _BoxDataEcerState();
}

class _BoxDataEcerState extends State<BoxDataEcer> {
  TextEditingController namaUser = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        height: 130,
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
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: Text(
                    DateFormat('dd-MM-yyyy || HH:mm').format(selectedDate))),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: Text('Safrizal'))
          ]),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.grey.shade700)),
              child: TextFormField(
                  controller: namaUser,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      labelText: 'Nama Pelanggan',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none)))
        ]));
  }
}
