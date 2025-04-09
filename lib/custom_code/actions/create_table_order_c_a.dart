// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createTableOrderCA(
  DocumentReference? userRef,
  DocumentReference? paymentMethodRef,
  bool placeToEat,
  String paymentRecipt,
  String tableNumber,
  bool paid,
  double subtotal,
  double total,
) async {
  final stateRef =
      FirebaseFirestore.instance.doc("/states/0G4ScxHR1XYz7vAQYYjE");

  try {
    final newTableOrderRef =
        await FirebaseFirestore.instance.collection('table_orders').add({
      'userRef': userRef,
      'payment_methodRef': paymentMethodRef,
      'table_number': tableNumber,
      'subtotal': subtotal,
      'total': total,
      'stateRef': stateRef,
      'paid': paid,
      'place_to_eat': placeToEat,
      'payment_recipt': paymentRecipt,
      'date': Timestamp.now(),
    });

    final cartSnapshot = await FirebaseFirestore.instance
        .collection('carrito')
        .where('userRef', isEqualTo: userRef)
        .get();

    for (final doc in cartSnapshot.docs) {
      final data = doc.data();
      await FirebaseFirestore.instance.collection('table_order_details').add({
        'table_orderRef': newTableOrderRef,
        'productRef': data['productRef'],
        'extra_ingredients': data['extra_ingredients'] ?? [],
        'description': data['extraDescription'] ?? '',
        'subtotal': data['subtotal'] ?? 0,
        'total': data['total'] ?? 0,
        'amount': data['cantidad'] ?? 1,
      });
    }

    for (final doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  } catch (e) {
    print('Error al crear la orden del cliente: $e');
  }
}
