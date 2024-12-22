import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_reclamation_widget.dart' show CreateReclamationWidget;
import 'package:flutter/material.dart';

class CreateReclamationModel extends FlutterFlowModel<CreateReclamationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for sujet widget.
  String? sujetValue;
  FormFieldController<String>? sujetValueController;
  // State field(s) for demande widget.
  FocusNode? demandeFocusNode;
  TextEditingController? demandeTextController;
  String? Function(BuildContext, String?)? demandeTextControllerValidator;
  String? _demandeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    demandeTextControllerValidator = _demandeTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    demandeFocusNode?.dispose();
    demandeTextController?.dispose();
  }
}
