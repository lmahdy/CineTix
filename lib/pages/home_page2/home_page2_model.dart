import '/flutter_flow/flutter_flow_util.dart';
import 'home_page2_widget.dart' show HomePage2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage2Model extends FlutterFlowModel<HomePage2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
