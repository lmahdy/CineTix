import '/flutter_flow/flutter_flow_util.dart';
import 'inspectevent_widget.dart' show InspecteventWidget;
import 'package:flutter/material.dart';

class InspecteventModel extends FlutterFlowModel<InspecteventWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
