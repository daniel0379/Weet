import '/flutter_flow/flutter_flow_util.dart';
import 'dessertcatagori_widget.dart' show DessertcatagoriWidget;
import 'package:flutter/material.dart';

class DessertcatagoriModel extends FlutterFlowModel<DessertcatagoriWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
