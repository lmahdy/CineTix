import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReclamationRecord extends FirestoreRecord {
  ReclamationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "sujet" field.
  String? _sujet;
  String get sujet => _sujet ?? '';
  bool hasSujet() => _sujet != null;

  // "demande" field.
  String? _demande;
  String get demande => _demande ?? '';
  bool hasDemande() => _demande != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _sujet = snapshotData['sujet'] as String?;
    _demande = snapshotData['demande'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reclamation');

  static Stream<ReclamationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReclamationRecord.fromSnapshot(s));

  static Future<ReclamationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReclamationRecord.fromSnapshot(s));

  static ReclamationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReclamationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReclamationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReclamationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReclamationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReclamationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReclamationRecordData({
  String? email,
  String? sujet,
  String? demande,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'sujet': sujet,
      'demande': demande,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReclamationRecordDocumentEquality implements Equality<ReclamationRecord> {
  const ReclamationRecordDocumentEquality();

  @override
  bool equals(ReclamationRecord? e1, ReclamationRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.sujet == e2?.sujet &&
        e1?.demande == e2?.demande;
  }

  @override
  int hash(ReclamationRecord? e) =>
      const ListEquality().hash([e?.email, e?.sujet, e?.demande]);

  @override
  bool isValidKey(Object? o) => o is ReclamationRecord;
}
