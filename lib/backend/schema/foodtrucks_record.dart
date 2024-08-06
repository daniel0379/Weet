import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodtrucksRecord extends FirestoreRecord {
  FoodtrucksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "foodtruckName" field.
  String? _foodtruckName;
  String get foodtruckName => _foodtruckName ?? '';
  bool hasFoodtruckName() => _foodtruckName != null;

  // "truckdiscription" field.
  String? _truckdiscription;
  String get truckdiscription => _truckdiscription ?? '';
  bool hasTruckdiscription() => _truckdiscription != null;

  // "truckimage" field.
  String? _truckimage;
  String get truckimage => _truckimage ?? '';
  bool hasTruckimage() => _truckimage != null;

  void _initializeFields() {
    _foodtruckName = snapshotData['foodtruckName'] as String?;
    _truckdiscription = snapshotData['truckdiscription'] as String?;
    _truckimage = snapshotData['truckimage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foodtrucks');

  static Stream<FoodtrucksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodtrucksRecord.fromSnapshot(s));

  static Future<FoodtrucksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodtrucksRecord.fromSnapshot(s));

  static FoodtrucksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodtrucksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodtrucksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodtrucksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodtrucksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodtrucksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodtrucksRecordData({
  String? foodtruckName,
  String? truckdiscription,
  String? truckimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'foodtruckName': foodtruckName,
      'truckdiscription': truckdiscription,
      'truckimage': truckimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodtrucksRecordDocumentEquality implements Equality<FoodtrucksRecord> {
  const FoodtrucksRecordDocumentEquality();

  @override
  bool equals(FoodtrucksRecord? e1, FoodtrucksRecord? e2) {
    return e1?.foodtruckName == e2?.foodtruckName &&
        e1?.truckdiscription == e2?.truckdiscription &&
        e1?.truckimage == e2?.truckimage;
  }

  @override
  int hash(FoodtrucksRecord? e) => const ListEquality()
      .hash([e?.foodtruckName, e?.truckdiscription, e?.truckimage]);

  @override
  bool isValidKey(Object? o) => o is FoodtrucksRecord;
}
