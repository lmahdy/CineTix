import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_reservation_widget.dart' show EditReservationWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EditReservationModel extends FlutterFlowModel<EditReservationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDownTItreup widget.
  String? dropDownTItreupValue;
  FormFieldController<String>? dropDownTItreupValueController;
  // State field(s) for DropDownFilmUp widget.
  String? dropDownFilmUpValue;
  FormFieldController<String>? dropDownFilmUpValueController;
  // State field(s) for DropDownSalleUp widget.
  String? dropDownSalleUpValue;
  FormFieldController<String>? dropDownSalleUpValueController;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
