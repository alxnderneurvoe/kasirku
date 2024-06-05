import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';
import 'stok_list.dart';

class StockListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: bluebg,
            title: Text('Stock List'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 40),
                  onPressed: () {
                    navToAddStok(context);
                  })
            ]),
        body: StockList());
  }
}
