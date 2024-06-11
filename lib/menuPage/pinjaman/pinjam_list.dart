import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PinjamanList extends StatelessWidget {
  final String? searchQuery;

  PinjamanList({this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('pinjaman').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var documents = snapshot.data!.docs;

        if (searchQuery != null && searchQuery!.isNotEmpty) {
          documents = documents.where((doc) {
            return doc['nama_peminjam'] == searchQuery;
          }).toList();
        }

        int totalLoans = documents.fold(0, (int total, doc) {
          return total + (doc['jumlah_pinjaman'] as int);
        });

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  var data = documents[index].data() as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['nama_peminjam']),
                    subtitle: Text(
                        'Jumlah: ${data['jumlah_pinjaman']}, Keperluan: ${data['keperluan']}'),
                  );
                },
              ),
            ),
            Divider(color: Colors.black45),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Total Pinjaman: $totalLoans',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
