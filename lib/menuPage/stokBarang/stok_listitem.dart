import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StockListItem extends StatefulWidget {
  final DocumentSnapshot document;

  const StockListItem({required this.document});

  @override
  _StockListItemState createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  late TextEditingController _quantityController;
  final TextEditingController _hargaEceranController = TextEditingController();
  final TextEditingController _hargaGrosirController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.document['jumlahstok'].toString(),
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
        widget.document['namabarang'],
        style: TextStyle(fontSize: 16),
      ),
      subtitle: _isEditing
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Quantity'),
                ),
                TextFormField(
                  controller: _hargaEceranController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Harga Eceran'),
                ),
                TextFormField(
                  controller: _hargaGrosirController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Harga Grosir'),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stock: ${widget.document['jumlahstok']}',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Harga Eceran: ${widget.document['harga_eceran']}',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Harga Grosir: ${widget.document['harga_grosir']}',
                  style: TextStyle(fontSize: 13),
                ),
                Divider(color: Colors.black54,)
              ],
            ),
      trailing: _isEditing
          ? IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('stock')
                    .doc(widget.document.id)
                    .update({
                  'jumlahstok': int.parse(_quantityController.text),
                  'harga_eceran': int.parse(_hargaEceranController.text),
                  'harga_grosir': int.parse(_hargaGrosirController.text),
                });
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
