// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createCustomerOrderCA(
  DocumentReference? userRef,
  DocumentReference? paymentMethodRef,
  bool deliveryMethod,
  String deliveryDirection,
  String paymentRecipt,
  double subtotal,
  double total,
) async {
  final stateRef =
      FirebaseFirestore.instance.doc("/states/5xPgMLdJOvMT8s2q9L9t");

  try {
    final tax = total - subtotal;
    final delivery_method = deliveryMethod ? "Domicilio" : "En el local";
    final paid = false;

    final newOrderRef =
        await FirebaseFirestore.instance.collection('customer_orders').add({
      'userRef': userRef,
      'payment_methodRef': paymentMethodRef,
      'delivery_method': delivery_method,
      'delivery_direction': deliveryDirection,
      'payment_receipt': paymentRecipt,
      'subtotal': subtotal,
      'total': total,
      'paid': paid,
      'order_date': Timestamp.now(),
      'tax': tax,
      'stateRef': stateRef,
    });

    final cartSnapshot = await FirebaseFirestore.instance
        .collection('carrito')
        .where('userRef', isEqualTo: userRef)
        .get();

    for (final doc in cartSnapshot.docs) {
      final data = doc.data();
      await FirebaseFirestore.instance
          .collection('customer_order_details')
          .add({
        'customer_orderRef': newOrderRef,
        'productRef': data['productRef'],
        'extra_ingredients': data['extra_ingredients'] ?? [],
        'description': data['extraDescription'] ?? '',
        'total': data['total'] ?? 0,
        'amount': data['cantidad'] ?? 1,
        'subtotal': data['subtotal'] ?? 0,
      });
    }

    for (final doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  } catch (e) {
    print('Error al crear la orden del cliente: $e');
    return null;
  }
}
