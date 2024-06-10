import 'package:flutter/material.dart';

import '../../model/color.dart';
import '../../model/nav.dart';
import 'pinjam_list.dart';

class PinjamanPage extends StatefulWidget {
  @override
  State<PinjamanPage> createState() => _PinjamanPageState();
}

class _PinjamanPageState extends State<PinjamanPage> {
  late TextEditingController _searchController;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      searchQuery = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: bluebg,
          title: Text('Pinjaman List'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 40),
                onPressed: () {
                  navToAddPinjaman(context);
                })
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _onSearchChanged();
              },
            ),
          ),
          Expanded(child: PinjamanList(searchQuery: searchQuery)),
        ],
      ),
    );
  }
}
