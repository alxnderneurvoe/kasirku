import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'stok_listitem.dart';

class StockList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('stock').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<DocumentSnapshot> stockItems = snapshot.data!.docs;
          if (searchResults.isNotEmpty) {
            stockItems = searchResults;
          }
          return ListView.builder(
            itemCount: stockItems.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = stockItems[index];
              return StockListItem(document: document);
            },
          );
        }
      },
    );
  }
}
