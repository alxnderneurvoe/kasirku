import 'package:flutter/material.dart';
import 'model/nav.dart';
import 'model/color.dart';

import 'bottomBar/botbar.dart';
import 'bottomBar/pengeluaran.dart';
import 'bottomBar/penjualan.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Container(
              height: 130,
              width: double.infinity,
              padding: EdgeInsets.only(top: 15, left: 15),
              color: Color.fromARGB(255, 18, 99, 192),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Toko Cabang',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    Text('Rp. ',
                        style: TextStyle(fontSize: 25, color: Colors.white))
                  ])),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(children: [
                    Row(children: [
                      // box button jual ecer
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                navToJualEcer(context);
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_basket_outlined,
                                            color: bluebg),
                                        Text('Jual Eceran',
                                            style: TextStyle(color: bluebg))
                                      ])))),
                      SizedBox(width: 15),
                      // box button jual grosir
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                navToJualGrosir(context);
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_shopping_cart_sharp,
                                            color: bluebg),
                                        Text('Jual Grosir',
                                            style: TextStyle(color: bluebg))
                                      ]))))
                    ]),
                    SizedBox(height: 30),
                    Row(children: [
                      // box button stock barang
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.view_quilt, color: bluebg),
                                        Text('Daftar Stok Barang',
                                            style: TextStyle(color: bluebg))
                                      ])))),
                      SizedBox(width: 15),
                      // box button daftar barang
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.receipt_long, color: bluebg),
                                        Text('Pengeluaran',
                                            style: TextStyle(color: bluebg))
                                      ]))))
                    ]),
                    SizedBox(height: 30),
                    Row(children: [
                      // box button laporan
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.bar_chart_outlined,
                                            color: bluebg),
                                        Text('Laporan',
                                            style: TextStyle(color: bluebg))
                                      ])))),
                      SizedBox(width: 15),
                      // box button setting
                      Expanded(
                          child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: bluebg.withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.brightness_low,
                                            color: bluebg),
                                        Text('Setting',
                                            style: TextStyle(color: bluebg))
                                      ]))))
                    ])
                  ])))
        ]),
        bottomNavigationBar:
            BottomNavBar(currentIndex: _currentIndex, onTap: itemTapped));
  }

  void itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Penjualan()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Pengeluaran()));
        break;
    }
  }
}
