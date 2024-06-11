import 'package:flutter/material.dart';
import '../loginpage.dart';
import '../dashboard/dashboard.dart';

import '../menuPage/jualEcer/ecer.dart';
import '../menuPage/jualGrosir/grosir.dart';
import '../menuPage/pinjaman/pinjam_add.dart';
import '../menuPage/stokBarang/stok_add.dart';
import '../menuPage/pinjaman/pinjam.dart';
import '../menuPage/stokBarang/stokbrg.dart';

void navToDashBoard(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
}

void navToLogin(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

void navToJualEcer(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => JualEcer()));
}

void navToJualGrosir(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => JualGrosir()));
}

void navToStokBrg(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => StockListPage()));
}

void navToAddStok(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddStockPage()));
}

void navToPinjaman(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PinjamanPage()));
}

void navToAddPinjaman(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddPinjamanPage()));
}

// void navToLaporan(BuildContext context) {
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => LaporanPage()));
// }
