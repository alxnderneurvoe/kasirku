import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'pinjam_listitem.dart';

class PinjamanList extends StatelessWidget {
  final String searchQuery;

  const PinjamanList({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('pinjaman')
          .orderBy('nama_peminjam')
          .snapshots(),
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
          if (searchQuery.isNotEmpty) {
            stockItems = stockItems.where((doc) {
              return doc['namabarang']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase());
            }).toList();
          }
          return ListView.builder(
            itemCount: stockItems.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = stockItems[index];
              return PinjamanListItem(document: document);
            },
          );
        }
      },
    );
  }
}
