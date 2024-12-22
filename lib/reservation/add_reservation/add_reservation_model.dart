import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_reservation_widget.dart' show AddReservationWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddReservationModel extends FlutterFlowModel<AddReservationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for DropDownTitre widget.
  String? dropDownTitreValue;
  FormFieldController<String>? dropDownTitreValueController;
  // State field(s) for DropDownFilm widget.
  String? dropDownFilmValue;
  FormFieldController<String>? dropDownFilmValueController;
  // State field(s) for DropDownSalle widget.
  String? dropDownSalleValue;
  FormFieldController<String>? dropDownSalleValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
