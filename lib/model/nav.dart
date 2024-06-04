import 'package:flutter/material.dart';
import '../loginpage.dart';

import '../dashboard.dart';
import '../menuPage/jualEcer/ecer.dart';
import '../menuPage/jualGrosir/grosir.dart';

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
