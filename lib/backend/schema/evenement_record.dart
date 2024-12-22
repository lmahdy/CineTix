import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvenementRecord extends FirestoreRecord {
  EvenementRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "duree" field.
  DateTime? _duree;
  DateTime? get duree => _duree;
  bool hasDuree() => _duree != null;

  // "reaction" field.
  List<String>? _reaction;
  List<String> get reaction => _reaction ?? const [];
  bool hasReaction() => _reaction != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "commentref" field.
  DocumentReference? _commentref;
  DocumentReference? get commentref => _commentref;
  bool hasCommentref() => _commentref != null;

  // "Event_saved_by" field.
  List<DocumentReference>? _eventSavedBy;
  List<DocumentReference> get eventSavedBy => _eventSavedBy ?? const [];
  bool hasEventSavedBy() => _eventSavedBy != null;

  // "EID" field.
  String? _eid;
  String get eid => _eid ?? '';
  bool hasEid() => _eid != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _description = snapshotData['description'] as String?;
    _duree = snapshotData['duree'] as DateTime?;
    _reaction = getDataList(snapshotData['reaction']);
    _poster = snapshotData['poster'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _commentref = snapshotData['commentref'] as DocumentReference?;
    _eventSavedBy = getDataList(snapshotData['Event_saved_by']);
    _eid = snapshotData['EID'] as String?;
    _image = getDataList(snapshotData['image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('evenement');

  static Stream<EvenementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EvenementRecord.fromSnapshot(s));

  static Future<EvenementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EvenementRecord.fromSnapshot(s));

  static EvenementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EvenementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EvenementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EvenementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EvenementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EvenementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEvenementRecordData({
  String? titre,
  String? description,
  DateTime? duree,
  DocumentReference? poster,
  DocumentReference? commentref,
  String? eid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'description': description,
      'duree': duree,
      'poster': poster,
      'commentref': commentref,
      'EID': eid,
    }.withoutNulls,
  );

  return firestoreData;
}

class EvenementRecordDocumentEquality implements Equality<EvenementRecord> {
  const EvenementRecordDocumentEquality();

  @override
  bool equals(EvenementRecord? e1, EvenementRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titre == e2?.titre &&
        e1?.description == e2?.description &&
        e1?.duree == e2?.duree &&
        listEquality.equals(e1?.reaction, e2?.reaction) &&
        e1?.poster == e2?.poster &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.commentref == e2?.commentref &&
        listEquality.equals(e1?.eventSavedBy, e2?.eventSavedBy) &&
        e1?.eid == e2?.eid &&
        listEquality.equals(e1?.image, e2?.image);
  }

  @override
  int hash(EvenementRecord? e) => const ListEquality().hash([
        e?.titre,
        e?.description,
        e?.duree,
        e?.reaction,
        e?.poster,
        e?.likes,
        e?.commentref,
        e?.eventSavedBy,
        e?.eid,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is EvenementRecord;
}
