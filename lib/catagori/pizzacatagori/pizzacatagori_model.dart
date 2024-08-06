import '/flutter_flow/flutter_flow_util.dart';
import 'pizzacatagori_widget.dart' show PizzacatagoriWidget;
import 'package:flutter/material.dart';

class PizzacatagoriModel extends FlutterFlowModel<PizzacatagoriWidget> {
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
