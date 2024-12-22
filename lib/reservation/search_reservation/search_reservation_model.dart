import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_reservation_widget.dart' show SearchReservationWidget;
import 'package:flutter/material.dart';

class SearchReservationModel extends FlutterFlowModel<SearchReservationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  List<ReservationRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
