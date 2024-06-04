import 'package:flutter/material.dart';

import '../../model/color.dart';

class BoxCariEcer extends StatefulWidget {
  const BoxCariEcer({super.key});

  @override
  State<BoxCariEcer> createState() => _BoxCariEcerState();
}

class _BoxCariEcerState extends State<BoxCariEcer> {
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
                      labelText: 'Cari Barang',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: TextFormField(
                    controller: namaUser,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                        labelText: 'Qty',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: InputBorder.none))),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade700)),
                child: GestureDetector(
                    onTap: () {},
                    child: Center(
                        child: Text('Add',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)))))
          ])
        ]));
  }
}
