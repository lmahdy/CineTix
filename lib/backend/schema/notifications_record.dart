import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "is_a_like" field.
  bool? _isALike;
  bool get isALike => _isALike ?? false;
  bool hasIsALike() => _isALike != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

  // "made_by" field.
  DocumentReference? _madeBy;
  DocumentReference? get madeBy => _madeBy;
  bool hasMadeBy() => _madeBy != null;

  // "made_to" field.
  DocumentReference? _madeTo;
  DocumentReference? get madeTo => _madeTo;
  bool hasMadeTo() => _madeTo != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "made_by_username" field.
  String? _madeByUsername;
  String get madeByUsername => _madeByUsername ?? '';
  bool hasMadeByUsername() => _madeByUsername != null;

  void _initializeFields() {
    _isALike = snapshotData['is_a_like'] as bool?;
    _isRead = snapshotData['is_read'] as bool?;
    _eventRef = snapshotData['event_ref'] as DocumentReference?;
    _madeBy = snapshotData['made_by'] as DocumentReference?;
    _madeTo = snapshotData['made_to'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _madeByUsername = snapshotData['made_by_username'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  bool? isALike,
  bool? isRead,
  DocumentReference? eventRef,
  DocumentReference? madeBy,
  DocumentReference? madeTo,
  DateTime? time,
  String? madeByUsername,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'is_a_like': isALike,
      'is_read': isRead,
      'event_ref': eventRef,
      'made_by': madeBy,
      'made_to': madeTo,
      'time': time,
      'made_by_username': madeByUsername,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.isALike == e2?.isALike &&
        e1?.isRead == e2?.isRead &&
        e1?.eventRef == e2?.eventRef &&
        e1?.madeBy == e2?.madeBy &&
        e1?.madeTo == e2?.madeTo &&
        e1?.time == e2?.time &&
        e1?.madeByUsername == e2?.madeByUsername;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.isALike,
        e?.isRead,
        e?.eventRef,
        e?.madeBy,
        e?.madeTo,
        e?.time,
        e?.madeByUsername
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
