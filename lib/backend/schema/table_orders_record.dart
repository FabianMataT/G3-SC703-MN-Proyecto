import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableOrdersRecord extends FirestoreRecord {
  TableOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "payment_methodRef" field.
  DocumentReference? _paymentMethodRef;
  DocumentReference? get paymentMethodRef => _paymentMethodRef;
  bool hasPaymentMethodRef() => _paymentMethodRef != null;

  // "table_number" field.
  String? _tableNumber;
  String get tableNumber => _tableNumber ?? '';
  bool hasTableNumber() => _tableNumber != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "stateRef" field.
  DocumentReference? _stateRef;
  DocumentReference? get stateRef => _stateRef;
  bool hasStateRef() => _stateRef != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _paymentMethodRef = snapshotData['payment_methodRef'] as DocumentReference?;
    _tableNumber = snapshotData['table_number'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _total = castToType<double>(snapshotData['total']);
    _stateRef = snapshotData['stateRef'] as DocumentReference?;
    _paid = snapshotData['paid'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('table_orders');

  static Stream<TableOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TableOrdersRecord.fromSnapshot(s));

  static Future<TableOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TableOrdersRecord.fromSnapshot(s));

  static TableOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TableOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TableOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TableOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TableOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TableOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTableOrdersRecordData({
  DocumentReference? userRef,
  DocumentReference? paymentMethodRef,
  String? tableNumber,
  double? subtotal,
  double? total,
  DocumentReference? stateRef,
  bool? paid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'payment_methodRef': paymentMethodRef,
      'table_number': tableNumber,
      'subtotal': subtotal,
      'total': total,
      'stateRef': stateRef,
      'paid': paid,
    }.withoutNulls,
  );

  return firestoreData;
}

class TableOrdersRecordDocumentEquality implements Equality<TableOrdersRecord> {
  const TableOrdersRecordDocumentEquality();

  @override
  bool equals(TableOrdersRecord? e1, TableOrdersRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.paymentMethodRef == e2?.paymentMethodRef &&
        e1?.tableNumber == e2?.tableNumber &&
        e1?.subtotal == e2?.subtotal &&
        e1?.total == e2?.total &&
        e1?.stateRef == e2?.stateRef &&
        e1?.paid == e2?.paid;
  }

  @override
  int hash(TableOrdersRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.paymentMethodRef,
        e?.tableNumber,
        e?.subtotal,
        e?.total,
        e?.stateRef,
        e?.paid
      ]);

  @override
  bool isValidKey(Object? o) => o is TableOrdersRecord;
}
