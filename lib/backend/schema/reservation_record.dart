import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "nbplace" field.
  String? _nbplace;
  String get nbplace => _nbplace ?? '';
  bool hasNbplace() => _nbplace != null;

  // "film" field.
  String? _film;
  String get film => _film ?? '';
  bool hasFilm() => _film != null;

  // "salle" field.
  String? _salle;
  String get salle => _salle ?? '';
  bool hasSalle() => _salle != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _nbplace = snapshotData['nbplace'] as String?;
    _film = snapshotData['film'] as String?;
    _salle = snapshotData['salle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationRecordData({
  String? titre,
  DateTime? date,
  String? nbplace,
  String? film,
  String? salle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'date': date,
      'nbplace': nbplace,
      'film': film,
      'salle': salle,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationRecordDocumentEquality implements Equality<ReservationRecord> {
  const ReservationRecordDocumentEquality();

  @override
  bool equals(ReservationRecord? e1, ReservationRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.date == e2?.date &&
        e1?.nbplace == e2?.nbplace &&
        e1?.film == e2?.film &&
        e1?.salle == e2?.salle;
  }

  @override
  int hash(ReservationRecord? e) => const ListEquality()
      .hash([e?.titre, e?.date, e?.nbplace, e?.film, e?.salle]);

  @override
  bool isValidKey(Object? o) => o is ReservationRecord;
}
