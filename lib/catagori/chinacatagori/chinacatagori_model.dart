import '/flutter_flow/flutter_flow_util.dart';
import 'chinacatagori_widget.dart' show ChinacatagoriWidget;
import 'package:flutter/material.dart';

class ChinacatagoriModel extends FlutterFlowModel<ChinacatagoriWidget> {
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
