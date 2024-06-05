import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'botbar.dart';
import '../dashboard/dashboard.dart';
import 'pengeluaran.dart';

class Penjualan extends StatefulWidget {
  const Penjualan({super.key});

  @override
  State<Penjualan> createState() => _PenjualanState();
}

class _PenjualanState extends State<Penjualan> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            alignment: Alignment.center,
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.only(top: 15),
            color: Color.fromARGB(255, 18, 99, 192),
            child: Text('History Penjualan',
                style: TextStyle(fontSize: 17, color: Colors.white))),
        Expanded(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/LoadingBox.json',
                      fit: BoxFit.cover)),
              const SizedBox(height: 50),
              Text('Data Kosong')
            ])))
      ]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: itemTapped,
      ),
    );
  }

  void itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Penjualan()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pengeluaran()),
        );
        break;
    }
  }
}
