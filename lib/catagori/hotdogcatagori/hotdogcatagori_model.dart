import '/flutter_flow/flutter_flow_util.dart';
import 'hotdogcatagori_widget.dart' show HotdogcatagoriWidget;
import 'package:flutter/material.dart';

class HotdogcatagoriModel extends FlutterFlowModel<HotdogcatagoriWidget> {
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
