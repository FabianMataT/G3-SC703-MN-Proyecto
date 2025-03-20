import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Additional ingredients that may be added to the product when ordered
class ExtraIngredientsRecord extends FirestoreRecord {
  ExtraIngredientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _amount = snapshotData['amount'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('extra_ingredients');

  static Stream<ExtraIngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExtraIngredientsRecord.fromSnapshot(s));

  static Future<ExtraIngredientsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExtraIngredientsRecord.fromSnapshot(s));

  static ExtraIngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExtraIngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExtraIngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExtraIngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExtraIngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExtraIngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExtraIngredientsRecordData({
  DocumentReference? productRef,
  String? name,
  String? amount,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productRef': productRef,
      'name': name,
      'amount': amount,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExtraIngredientsRecordDocumentEquality
    implements Equality<ExtraIngredientsRecord> {
  const ExtraIngredientsRecordDocumentEquality();

  @override
  bool equals(ExtraIngredientsRecord? e1, ExtraIngredientsRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ExtraIngredientsRecord? e) =>
      const ListEquality().hash([e?.productRef, e?.name, e?.amount, e?.price]);

  @override
  bool isValidKey(Object? o) => o is ExtraIngredientsRecord;
}
