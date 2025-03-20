import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerOrderDetailsRecord extends FirestoreRecord {
  CustomerOrderDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_orderRef" field.
  DocumentReference? _customerOrderRef;
  DocumentReference? get customerOrderRef => _customerOrderRef;
  bool hasCustomerOrderRef() => _customerOrderRef != null;

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

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _customerOrderRef = snapshotData['customer_orderRef'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _extraIngredients = getDataList(snapshotData['extra_ingredients']);
    _description = snapshotData['description'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _amount = castToType<int>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_order_details');

  static Stream<CustomerOrderDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerOrderDetailsRecord.fromSnapshot(s));

  static Future<CustomerOrderDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomerOrderDetailsRecord.fromSnapshot(s));

  static CustomerOrderDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerOrderDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerOrderDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerOrderDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerOrderDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerOrderDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerOrderDetailsRecordData({
  DocumentReference? customerOrderRef,
  DocumentReference? productRef,
  String? description,
  double? total,
  int? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_orderRef': customerOrderRef,
      'productRef': productRef,
      'description': description,
      'total': total,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerOrderDetailsRecordDocumentEquality
    implements Equality<CustomerOrderDetailsRecord> {
  const CustomerOrderDetailsRecordDocumentEquality();

  @override
  bool equals(CustomerOrderDetailsRecord? e1, CustomerOrderDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.customerOrderRef == e2?.customerOrderRef &&
        e1?.productRef == e2?.productRef &&
        listEquality.equals(e1?.extraIngredients, e2?.extraIngredients) &&
        e1?.description == e2?.description &&
        e1?.total == e2?.total &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(CustomerOrderDetailsRecord? e) => const ListEquality().hash([
        e?.customerOrderRef,
        e?.productRef,
        e?.extraIngredients,
        e?.description,
        e?.total,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerOrderDetailsRecord;
}
