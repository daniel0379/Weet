import '/flutter_flow/flutter_flow_util.dart';
import 'baveragecatagori_widget.dart' show BaveragecatagoriWidget;
import 'package:flutter/material.dart';

class BaveragecatagoriModel extends FlutterFlowModel<BaveragecatagoriWidget> {
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
