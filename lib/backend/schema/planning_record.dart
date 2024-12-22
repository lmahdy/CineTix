import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanningRecord extends FirestoreRecord {
  PlanningRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "heure" field.
  String? _heure;
  String get heure => _heure ?? '';
  bool hasHeure() => _heure != null;

  // "films" field.
  DocumentReference? _films;
  DocumentReference? get films => _films;
  bool hasFilms() => _films != null;

  // "salles" field.
  DocumentReference? _salles;
  DocumentReference? get salles => _salles;
  bool hasSalles() => _salles != null;

  // "events" field.
  DocumentReference? _events;
  DocumentReference? get events => _events;
  bool hasEvents() => _events != null;

  // "listTicketRes" field.
  List<String>? _listTicketRes;
  List<String> get listTicketRes => _listTicketRes ?? const [];
  bool hasListTicketRes() => _listTicketRes != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _heure = snapshotData['heure'] as String?;
    _films = snapshotData['films'] as DocumentReference?;
    _salles = snapshotData['salles'] as DocumentReference?;
    _events = snapshotData['events'] as DocumentReference?;
    _listTicketRes = getDataList(snapshotData['listTicketRes']);
    _type = snapshotData['type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planning');

  static Stream<PlanningRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanningRecord.fromSnapshot(s));

  static Future<PlanningRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanningRecord.fromSnapshot(s));

  static PlanningRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlanningRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanningRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanningRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanningRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanningRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanningRecordData({
  DateTime? date,
  String? heure,
  DocumentReference? films,
  DocumentReference? salles,
  DocumentReference? events,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'heure': heure,
      'films': films,
      'salles': salles,
      'events': events,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanningRecordDocumentEquality implements Equality<PlanningRecord> {
  const PlanningRecordDocumentEquality();

  @override
  bool equals(PlanningRecord? e1, PlanningRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.heure == e2?.heure &&
        e1?.films == e2?.films &&
        e1?.salles == e2?.salles &&
        e1?.events == e2?.events &&
        listEquality.equals(e1?.listTicketRes, e2?.listTicketRes) &&
        e1?.type == e2?.type;
  }

  @override
  int hash(PlanningRecord? e) => const ListEquality().hash([
        e?.date,
        e?.heure,
        e?.films,
        e?.salles,
        e?.events,
        e?.listTicketRes,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is PlanningRecord;
}
