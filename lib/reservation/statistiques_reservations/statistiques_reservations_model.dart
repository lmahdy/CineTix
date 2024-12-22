import '/flutter_flow/flutter_flow_util.dart';
import 'statistiques_reservations_widget.dart'
    show StatistiquesReservationsWidget;
import 'package:flutter/material.dart';

class StatistiquesReservationsModel
    extends FlutterFlowModel<StatistiquesReservationsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
