import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// When a customer order by the app in the car
class CustomerOrdersRecord extends FirestoreRecord {
  CustomerOrdersRecord._(
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

  // "delivery_method" field.
  String? _deliveryMethod;
  String get deliveryMethod => _deliveryMethod ?? '';
  bool hasDeliveryMethod() => _deliveryMethod != null;

  // "payment_receipt" field.
  String? _paymentReceipt;
  String get paymentReceipt => _paymentReceipt ?? '';
  bool hasPaymentReceipt() => _paymentReceipt != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "order_date" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "delivery_direction" field.
  String? _deliveryDirection;
  String get deliveryDirection => _deliveryDirection ?? '';
  bool hasDeliveryDirection() => _deliveryDirection != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "stateRef" field.
  DocumentReference? _stateRef;
  DocumentReference? get stateRef => _stateRef;
  bool hasStateRef() => _stateRef != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _paymentMethodRef = snapshotData['payment_methodRef'] as DocumentReference?;
    _deliveryMethod = snapshotData['delivery_method'] as String?;
    _paymentReceipt = snapshotData['payment_receipt'] as String?;
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _total = castToType<double>(snapshotData['total']);
    _paid = snapshotData['paid'] as bool?;
    _orderDate = snapshotData['order_date'] as DateTime?;
    _deliveryDirection = snapshotData['delivery_direction'] as String?;
    _tax = castToType<double>(snapshotData['tax']);
    _stateRef = snapshotData['stateRef'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_orders');

  static Stream<CustomerOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerOrdersRecord.fromSnapshot(s));

  static Future<CustomerOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerOrdersRecord.fromSnapshot(s));

  static CustomerOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerOrdersRecordData({
  DocumentReference? userRef,
  DocumentReference? paymentMethodRef,
  String? deliveryMethod,
  String? paymentReceipt,
  double? subtotal,
  double? total,
  bool? paid,
  DateTime? orderDate,
  String? deliveryDirection,
  double? tax,
  DocumentReference? stateRef,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'payment_methodRef': paymentMethodRef,
      'delivery_method': deliveryMethod,
      'payment_receipt': paymentReceipt,
      'subtotal': subtotal,
      'total': total,
      'paid': paid,
      'order_date': orderDate,
      'delivery_direction': deliveryDirection,
      'tax': tax,
      'stateRef': stateRef,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerOrdersRecordDocumentEquality
    implements Equality<CustomerOrdersRecord> {
  const CustomerOrdersRecordDocumentEquality();

  @override
  bool equals(CustomerOrdersRecord? e1, CustomerOrdersRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.paymentMethodRef == e2?.paymentMethodRef &&
        e1?.deliveryMethod == e2?.deliveryMethod &&
        e1?.paymentReceipt == e2?.paymentReceipt &&
        e1?.subtotal == e2?.subtotal &&
        e1?.total == e2?.total &&
        e1?.paid == e2?.paid &&
        e1?.orderDate == e2?.orderDate &&
        e1?.deliveryDirection == e2?.deliveryDirection &&
        e1?.tax == e2?.tax &&
        e1?.stateRef == e2?.stateRef &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CustomerOrdersRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.paymentMethodRef,
        e?.deliveryMethod,
        e?.paymentReceipt,
        e?.subtotal,
        e?.total,
        e?.paid,
        e?.orderDate,
        e?.deliveryDirection,
        e?.tax,
        e?.stateRef,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerOrdersRecord;
}
