import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_film_widget.dart' show ListFilmWidget;
import 'package:flutter/material.dart';

class ListFilmModel extends FlutterFlowModel<ListFilmWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<FilmRecord, bool> checkboxValueMap1 = {};
  List<FilmRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<FilmRecord, bool> checkboxValueMap2 = {};
  List<FilmRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<FilmRecord, bool> checkboxValueMap3 = {};
  List<FilmRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
