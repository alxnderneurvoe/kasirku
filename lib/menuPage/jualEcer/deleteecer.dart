import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(
    BuildContext context, DocumentSnapshot booking) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Delete Confirmation"),
            content: const Text("Are you sure you want to delete this item?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    deleteBooking(booking);
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"))
            ]);
      });
}

void deleteBooking(DocumentSnapshot booking) async {
  try {
    await booking.reference.delete();
  } catch (e) {}
}
