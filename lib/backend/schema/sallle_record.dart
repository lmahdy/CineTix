import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SallleRecord extends FirestoreRecord {
  SallleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "nbplace" field.
  String? _nbplace;
  String get nbplace => _nbplace ?? '';
  bool hasNbplace() => _nbplace != null;

  // "placecategories" field.
  List<SeatCategoriesDetailsStruct>? _placecategories;
  List<SeatCategoriesDetailsStruct> get placecategories =>
      _placecategories ?? const [];
  bool hasPlacecategories() => _placecategories != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _size = snapshotData['size'] as String?;
    _type = snapshotData['type'] as String?;
    _nbplace = snapshotData['nbplace'] as String?;
    _placecategories = getStructList(
      snapshotData['placecategories'],
      SeatCategoriesDetailsStruct.fromMap,
    );
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sallle');

  static Stream<SallleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SallleRecord.fromSnapshot(s));

  static Future<SallleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SallleRecord.fromSnapshot(s));

  static SallleRecord fromSnapshot(DocumentSnapshot snapshot) => SallleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SallleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SallleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SallleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SallleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSallleRecordData({
  String? nom,
  String? size,
  String? type,
  String? nbplace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'size': size,
      'type': type,
      'nbplace': nbplace,
    }.withoutNulls,
  );

  return firestoreData;
}

class SallleRecordDocumentEquality implements Equality<SallleRecord> {
  const SallleRecordDocumentEquality();

  @override
  bool equals(SallleRecord? e1, SallleRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nom == e2?.nom &&
        e1?.size == e2?.size &&
        e1?.type == e2?.type &&
        e1?.nbplace == e2?.nbplace &&
        listEquality.equals(e1?.placecategories, e2?.placecategories) &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(SallleRecord? e) => const ListEquality().hash(
      [e?.nom, e?.size, e?.type, e?.nbplace, e?.placecategories, e?.images]);

  @override
  bool isValidKey(Object? o) => o is SallleRecord;
}
