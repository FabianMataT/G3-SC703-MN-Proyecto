import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int? pieChartPedidos(
  int? domicilio,
  double? retiroLocal,
) {
  // porcentaje de pedidos retirados en el local y enviados a domicilio
  if (domicilio == null || retiroLocal == null) {
    return null;
  }

  double totalPedidos = domicilio + retiroLocal;
  double porcentajeRetiroLocal = (retiroLocal / totalPedidos) * 100;

  return porcentajeRetiroLocal.toInt();
}

double calculateNewSubtotalFunction(
  double extraIngredientPrice,
  double subtotal,
) {
  // Realizar la resta
  double newTotal = subtotal - extraIngredientPrice;

  // Retornar el nuevo valor
  return newTotal;
}

double calculateNewTotalFunction(
  int productCount,
  double subTotal,
) {
  double total = productCount * subTotal;
  return total;
}

double calculateTaxFunction(double subtotal) {
  double impuesto = 0.13 * subtotal;
  return impuesto;
}

double totalCartFunction(
  double subtotal,
  double impuesto,
  bool envioDomicilio,
) {
  double total = 0;
  if (envioDomicilio) {
    total = subtotal + impuesto + 1500;
  } else {
    total = subtotal + impuesto;
  }
  return total;
}

double subtotalCartFunction(List<CarritoRecord> carritoItems) {
  double subtotalCarrito = 0;

  // Iterar a través de los items del carrito y sumar los subtotales
  for (var item in carritoItems) {
    if (item.subtotal != null) {
      subtotalCarrito += item.subtotal!;
    }
  }

  return subtotalCarrito;
}

double calculateSubtotalBeforeEditFunction(
  double subtotal,
  int cantidad,
) {
  double subtotalCarrito = subtotal / cantidad;
  return subtotalCarrito;
}

DocumentReference insertCustomerOrderFunction(
  DocumentReference userRef,
  DocumentReference paymentMethodRef,
  bool deliveryMethod,
  String description,
  String paymentRecipt,
  double subtotal,
  double total,
  DocumentReference stateRef,
  bool paid,
  DateTime orderDate,
  String deliveryDirection,
) {
// Referencia de la colección 'customer_order'
  CollectionReference customerOrderCollection =
      FirebaseFirestore.instance.collection('customer_order');

  // Crear un nuevo documento en 'customer_order' y obtener su referencia
  DocumentReference newOrderRef = customerOrderCollection.doc();

  // Insertar los datos en el nuevo documento
  newOrderRef.set({
    'userRef': userRef,
    'payment_methodRef': paymentMethodRef,
    'delivery_method': deliveryMethod,
    'description': description,
    'payment_receipt': paymentRecipt,
    'subtotal': subtotal,
    'total': total,
    'stateRef': stateRef,
    'paid': paid,
    'order_date': orderDate,
    'delivery_direction': deliveryDirection,
  });

  // Retornar la referencia del documento recién creado
  return newOrderRef;
}
