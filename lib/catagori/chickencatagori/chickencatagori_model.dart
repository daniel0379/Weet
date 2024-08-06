import '/flutter_flow/flutter_flow_util.dart';
import 'chickencatagori_widget.dart' show ChickencatagoriWidget;
import 'package:flutter/material.dart';

class ChickencatagoriModel extends FlutterFlowModel<ChickencatagoriWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
