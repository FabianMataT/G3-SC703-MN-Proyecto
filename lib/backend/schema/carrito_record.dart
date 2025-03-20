import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "extra_ingredients" field.
  List<DocumentReference>? _extraIngredients;
  List<DocumentReference> get extraIngredients => _extraIngredients ?? const [];
  bool hasExtraIngredients() => _extraIngredients != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "extraDescription" field.
  String? _extraDescription;
  String get extraDescription => _extraDescription ?? '';
  bool hasExtraDescription() => _extraDescription != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _extraIngredients = getDataList(snapshotData['extra_ingredients']);
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _extraDescription = snapshotData['extraDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carrito');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  DocumentReference? userRef,
  DocumentReference? productRef,
  int? cantidad,
  double? subtotal,
  String? extraDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'productRef': productRef,
      'cantidad': cantidad,
      'subtotal': subtotal,
      'extraDescription': extraDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.productRef == e2?.productRef &&
        listEquality.equals(e1?.extraIngredients, e2?.extraIngredients) &&
        e1?.cantidad == e2?.cantidad &&
        e1?.subtotal == e2?.subtotal &&
        e1?.extraDescription == e2?.extraDescription;
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.productRef,
        e?.extraIngredients,
        e?.cantidad,
        e?.subtotal,
        e?.extraDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
