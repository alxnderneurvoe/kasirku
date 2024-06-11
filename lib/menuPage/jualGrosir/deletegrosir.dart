
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showDeleteGrosir(
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
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              deleteBooking(booking);
              Navigator.pop(context);

              showDeleteSuccessNotification(context);
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}

void showDeleteSuccessNotification(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Delete success!"),
      duration: Duration(seconds: 3),
    ),
  );
}

void deleteBooking(DocumentSnapshot booking) async {
  try {
    await booking.reference.delete();

    print("Booking deleted successfully");
  } catch (e) {
    print("Error deleting booking: $e");
  }
}
