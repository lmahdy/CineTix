import '/flutter_flow/flutter_flow_util.dart';
import 'list_event_widget.dart' show ListEventWidget;
import 'package:flutter/material.dart';

class ListEventModel extends FlutterFlowModel<ListEventWidget> {
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
