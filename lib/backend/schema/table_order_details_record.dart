import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableOrderDetailsRecord extends FirestoreRecord {
  TableOrderDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "table_orderRef" field.
  DocumentReference? _tableOrderRef;
  DocumentReference? get tableOrderRef => _tableOrderRef;
  bool hasTableOrderRef() => _tableOrderRef != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "extra_ingredients" field.
  List<DocumentReference>? _extraIngredients;
  List<DocumentReference> get extraIngredients => _extraIngredients ?? const [];
  bool hasExtraIngredients() => _extraIngredients != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _tableOrderRef = snapshotData['table_orderRef'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _extraIngredients = getDataList(snapshotData['extra_ingredients']);
    _description = snapshotData['description'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _total = castToType<double>(snapshotData['total']);
    _amount = castToType<int>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('table_order_details');

  static Stream<TableOrderDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableOrderDetailsRecord.fromSnapshot(s));

  static Future<TableOrderDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TableOrderDetailsRecord.fromSnapshot(s));

  static TableOrderDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableOrderDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableOrderDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableOrderDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableOrderDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableOrderDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableOrderDetailsRecordData({
  DocumentReference? tableOrderRef,
  DocumentReference? productRef,
  String? description,
  double? subtotal,
  double? total,
  int? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'table_orderRef': tableOrderRef,
      'productRef': productRef,
      'description': description,
      'subtotal': subtotal,
      'total': total,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableOrderDetailsRecordDocumentEquality
    implements Equality<TableOrderDetailsRecord> {
  const TableOrderDetailsRecordDocumentEquality();

  @override
  bool equals(TableOrderDetailsRecord? e1, TableOrderDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tableOrderRef == e2?.tableOrderRef &&
        e1?.productRef == e2?.productRef &&
        listEquality.equals(e1?.extraIngredients, e2?.extraIngredients) &&
        e1?.description == e2?.description &&
        e1?.subtotal == e2?.subtotal &&
        e1?.total == e2?.total &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(TableOrderDetailsRecord? e) => const ListEquality().hash([
        e?.tableOrderRef,
        e?.productRef,
        e?.extraIngredients,
        e?.description,
        e?.subtotal,
        e?.total,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is TableOrderDetailsRecord;
}
