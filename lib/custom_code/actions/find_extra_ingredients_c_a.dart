// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> findExtraIngredientsCA(
    List<DocumentReference>? extraIngredients) async {
  List<String> names = [];

  if (extraIngredients == null || extraIngredients.isEmpty) {
    return names;
  }

  try {
    for (final ref in extraIngredients) {
      final doc = await ref.get();
      final data = doc.data() as Map<String, dynamic>?;
      final name = data?['name'];
      if (name != null && name is String) {
        names.add(name);
      }
    }
  } catch (e) {
    print('Error obteniendo los nombres de extraIngredients: $e');
  }

  return names;
}
