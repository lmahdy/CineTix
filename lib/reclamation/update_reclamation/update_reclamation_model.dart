import '/flutter_flow/flutter_flow_util.dart';
import 'update_reclamation_widget.dart' show UpdateReclamationWidget;
import 'package:flutter/material.dart';

class UpdateReclamationModel extends FlutterFlowModel<UpdateReclamationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Sujet widget.
  FocusNode? sujetFocusNode;
  TextEditingController? sujetTextController;
  String? Function(BuildContext, String?)? sujetTextControllerValidator;
  // State field(s) for Demande widget.
  FocusNode? demandeFocusNode;
  TextEditingController? demandeTextController;
  String? Function(BuildContext, String?)? demandeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    sujetFocusNode?.dispose();
    sujetTextController?.dispose();

    demandeFocusNode?.dispose();
    demandeTextController?.dispose();
  }
}
