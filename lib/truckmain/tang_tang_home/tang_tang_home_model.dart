import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang_home_widget.dart' show TangTangHomeWidget;
import 'package:flutter/material.dart';

class TangTangHomeModel extends FlutterFlowModel<TangTangHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
