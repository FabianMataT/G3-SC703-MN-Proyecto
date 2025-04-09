// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future vaciarCarritoCA(DocumentReference? userRef) async {
  try {
    final cartSnapshot = await FirebaseFirestore.instance
        .collection('carrito')
        .where('userRef', isEqualTo: userRef)
        .get();

    for (final doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  } catch (e) {
    print('Error al crear la orden del cliente: $e');
    return null;
  }
}
