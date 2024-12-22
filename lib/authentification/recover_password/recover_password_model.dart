import '/flutter_flow/flutter_flow_util.dart';
import 'recover_password_widget.dart' show RecoverPasswordWidget;
import 'package:flutter/material.dart';

class RecoverPasswordModel extends FlutterFlowModel<RecoverPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailRecover widget.
  FocusNode? emailRecoverFocusNode;
  TextEditingController? emailRecoverTextController;
  String? Function(BuildContext, String?)? emailRecoverTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailRecoverFocusNode?.dispose();
    emailRecoverTextController?.dispose();
  }
}
