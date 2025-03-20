import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodsRecord extends FirestoreRecord {
  PaymentMethodsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "descripton" field.
  String? _descripton;
  String get descripton => _descripton ?? '';
  bool hasDescripton() => _descripton != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _descripton = snapshotData['descripton'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_methods');

  static Stream<PaymentMethodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodsRecord.fromSnapshot(s));

  static Future<PaymentMethodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodsRecord.fromSnapshot(s));

  static PaymentMethodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentMethodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentMethodsRecordData({
  String? name,
  String? descripton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'descripton': descripton,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentMethodsRecordDocumentEquality
    implements Equality<PaymentMethodsRecord> {
  const PaymentMethodsRecordDocumentEquality();

  @override
  bool equals(PaymentMethodsRecord? e1, PaymentMethodsRecord? e2) {
    return e1?.name == e2?.name && e1?.descripton == e2?.descripton;
  }

  @override
  int hash(PaymentMethodsRecord? e) =>
      const ListEquality().hash([e?.name, e?.descripton]);

  @override
  bool isValidKey(Object? o) => o is PaymentMethodsRecord;
}
