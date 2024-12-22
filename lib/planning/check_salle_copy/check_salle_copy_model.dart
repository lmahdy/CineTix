import '/flutter_flow/flutter_flow_util.dart';
import 'check_salle_copy_widget.dart' show CheckSalleCopyWidget;
import 'package:flutter/material.dart';

class CheckSalleCopyModel extends FlutterFlowModel<CheckSalleCopyWidget> {
  ///  State fields for stateful widgets in this component.

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
