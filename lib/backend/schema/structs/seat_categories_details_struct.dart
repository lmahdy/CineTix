// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SeatCategoriesDetailsStruct extends FFFirebaseStruct {
  SeatCategoriesDetailsStruct({
    String? categoryOfSeat,
    int? seatCount,
    double? seatPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryOfSeat = categoryOfSeat,
        _seatCount = seatCount,
        _seatPrice = seatPrice,
        super(firestoreUtilData);

  // "categoryOfSeat" field.
  String? _categoryOfSeat;
  String get categoryOfSeat => _categoryOfSeat ?? 'moo';
  set categoryOfSeat(String? val) => _categoryOfSeat = val;

  bool hasCategoryOfSeat() => _categoryOfSeat != null;

  // "seatCount" field.
  int? _seatCount;
  int get seatCount => _seatCount ?? 40;
  set seatCount(int? val) => _seatCount = val;

  void incrementSeatCount(int amount) => seatCount = seatCount + amount;

  bool hasSeatCount() => _seatCount != null;

  // "seatPrice" field.
  double? _seatPrice;
  double get seatPrice => _seatPrice ?? 20.0;
  set seatPrice(double? val) => _seatPrice = val;

  void incrementSeatPrice(double amount) => seatPrice = seatPrice + amount;

  bool hasSeatPrice() => _seatPrice != null;

  static SeatCategoriesDetailsStruct fromMap(Map<String, dynamic> data) =>
      SeatCategoriesDetailsStruct(
        categoryOfSeat: data['categoryOfSeat'] as String?,
        seatCount: castToType<int>(data['seatCount']),
        seatPrice: castToType<double>(data['seatPrice']),
      );

  static SeatCategoriesDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? SeatCategoriesDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoryOfSeat': _categoryOfSeat,
        'seatCount': _seatCount,
        'seatPrice': _seatPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryOfSeat': serializeParam(
          _categoryOfSeat,
          ParamType.String,
        ),
        'seatCount': serializeParam(
          _seatCount,
          ParamType.int,
        ),
        'seatPrice': serializeParam(
          _seatPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static SeatCategoriesDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SeatCategoriesDetailsStruct(
        categoryOfSeat: deserializeParam(
          data['categoryOfSeat'],
          ParamType.String,
          false,
        ),
        seatCount: deserializeParam(
          data['seatCount'],
          ParamType.int,
          false,
        ),
        seatPrice: deserializeParam(
          data['seatPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SeatCategoriesDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeatCategoriesDetailsStruct &&
        categoryOfSeat == other.categoryOfSeat &&
        seatCount == other.seatCount &&
        seatPrice == other.seatPrice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([categoryOfSeat, seatCount, seatPrice]);
}

SeatCategoriesDetailsStruct createSeatCategoriesDetailsStruct({
  String? categoryOfSeat,
  int? seatCount,
  double? seatPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SeatCategoriesDetailsStruct(
      categoryOfSeat: categoryOfSeat,
      seatCount: seatCount,
      seatPrice: seatPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SeatCategoriesDetailsStruct? updateSeatCategoriesDetailsStruct(
  SeatCategoriesDetailsStruct? seatCategoriesDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    seatCategoriesDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSeatCategoriesDetailsStructData(
  Map<String, dynamic> firestoreData,
  SeatCategoriesDetailsStruct? seatCategoriesDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (seatCategoriesDetails == null) {
    return;
  }
  if (seatCategoriesDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      seatCategoriesDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final seatCategoriesDetailsData = getSeatCategoriesDetailsFirestoreData(
      seatCategoriesDetails, forFieldValue);
  final nestedData =
      seatCategoriesDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      seatCategoriesDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSeatCategoriesDetailsFirestoreData(
  SeatCategoriesDetailsStruct? seatCategoriesDetails, [
  bool forFieldValue = false,
]) {
  if (seatCategoriesDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(seatCategoriesDetails.toMap());

  // Add any Firestore field values
  seatCategoriesDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSeatCategoriesDetailsListFirestoreData(
  List<SeatCategoriesDetailsStruct>? seatCategoriesDetailss,
) =>
    seatCategoriesDetailss
        ?.map((e) => getSeatCategoriesDetailsFirestoreData(e, true))
        .toList() ??
    [];
