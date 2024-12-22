import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilmRecord extends FirestoreRecord {
  FilmRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "duree" field.
  String? _duree;
  String get duree => _duree ?? '';
  bool hasDuree() => _duree != null;

  // "categorie" field.
  String? _categorie;
  String get categorie => _categorie ?? '';
  bool hasCategorie() => _categorie != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "FID" field.
  String? _fid;
  String get fid => _fid ?? '';
  bool hasFid() => _fid != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _duree = snapshotData['duree'] as String?;
    _categorie = snapshotData['categorie'] as String?;
    _description = snapshotData['description'] as String?;
    _date = snapshotData['date'] as String?;
    _age = snapshotData['age'] as String?;
    _fid = snapshotData['FID'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Film');

  static Stream<FilmRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilmRecord.fromSnapshot(s));

  static Future<FilmRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilmRecord.fromSnapshot(s));

  static FilmRecord fromSnapshot(DocumentSnapshot snapshot) => FilmRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilmRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilmRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilmRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilmRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilmRecordData({
  String? titre,
  String? duree,
  String? categorie,
  String? description,
  String? date,
  String? age,
  String? fid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'duree': duree,
      'categorie': categorie,
      'description': description,
      'date': date,
      'age': age,
      'FID': fid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilmRecordDocumentEquality implements Equality<FilmRecord> {
  const FilmRecordDocumentEquality();

  @override
  bool equals(FilmRecord? e1, FilmRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titre == e2?.titre &&
        e1?.duree == e2?.duree &&
        e1?.categorie == e2?.categorie &&
        e1?.description == e2?.description &&
        e1?.date == e2?.date &&
        e1?.age == e2?.age &&
        e1?.fid == e2?.fid &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(FilmRecord? e) => const ListEquality().hash([
        e?.titre,
        e?.duree,
        e?.categorie,
        e?.description,
        e?.date,
        e?.age,
        e?.fid,
        e?.images
      ]);

  @override
  bool isValidKey(Object? o) => o is FilmRecord;
}
