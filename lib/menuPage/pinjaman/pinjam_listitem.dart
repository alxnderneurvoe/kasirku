import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PinjamanListItem extends StatefulWidget {
  final DocumentSnapshot document;

  const PinjamanListItem({required this.document});

  @override
  _PinjamanListItemState createState() => _PinjamanListItemState();
}

class _PinjamanListItemState extends State<PinjamanListItem> {
  late TextEditingController _quantityController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.document['jumlah_pinjaman'].toString(),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.document['nama_peminjam'],
        style: TextStyle(fontSize: 20),
      ),
      subtitle: _isEditing
          ? TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
            )
          : Text(
            'Pinjaman : ${widget.document['jumlah_pinjaman']}',
            style: TextStyle(fontSize: 15),
          ),
      trailing: _isEditing
          ? IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('pinjaman')
                    .doc(widget.document.id)
                    .update(
                        {'jumlah_pinjaman': int.parse(_quantityController.text)});
                setState(() {
                  _isEditing = false;
                });
              },
            )
          : IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
    );
  }
}
