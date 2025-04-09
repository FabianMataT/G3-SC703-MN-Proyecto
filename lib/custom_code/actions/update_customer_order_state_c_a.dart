// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updateCustomerOrderStateCA(
  DocumentReference? customerOrderRef,
  String? stateName,
) async {
  if (customerOrderRef != null && stateName != null) {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('states')
        .where('name', isEqualTo: stateName)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final stateDocRef = querySnapshot.docs.first.reference;

      await customerOrderRef.update({
        'stateRef': stateDocRef,
      });

      print("Actualizó con éxito");
    } else {
      print("No se encontró un estado con el nombre proporcionado.");
    }
  } else {
    print("customerOrderRef o stateName es null.");
  }
}
