import 'package:flutter/material.dart';
import '/dashboard/page/btn_grosir.dart';
import '/dashboard/page/btn_laporan.dart';
import '/dashboard/page/btn_pengeluaran.dart';
import '/dashboard/page/btn_pinjaman.dart';
import '/dashboard/page/btn_stokbrg.dart';

import '../bottomBar/botbar.dart';
import '../bottomBar/pengeluaran.dart';
import '../bottomBar/penjualan.dart';
import 'page/btn_ecer.dart';

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
                      BtnEcer(),
                      SizedBox(width: 15),
                      BtnGrosir()
                    ]),
                    SizedBox(height: 30),
                    Row(children: [
                      BtnStokBarang(),
                      SizedBox(width: 15),
                      BtnPengeluaran()
                    ]),
                    SizedBox(height: 30),
                    Row(children: [
                      BtnLaporan(),
                      SizedBox(width: 15),
                      BtnPinjaman()
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
