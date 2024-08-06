import '/flutter_flow/flutter_flow_util.dart';
import 'cupbapcatagori_widget.dart' show CupbapcatagoriWidget;
import 'package:flutter/material.dart';

class CupbapcatagoriModel extends FlutterFlowModel<CupbapcatagoriWidget> {
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
