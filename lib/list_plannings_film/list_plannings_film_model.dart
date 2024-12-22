import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_plannings_film_widget.dart' show ListPlanningsFilmWidget;
import 'package:flutter/material.dart';

class ListPlanningsFilmModel extends FlutterFlowModel<ListPlanningsFilmWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  DateTime? datePicked1;
  List<FilmRecord> simpleSearchResults1 = [];
  DateTime? datePicked2;
  List<FilmRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
