import '/flutter_flow/flutter_flow_util.dart';
import 'hotdoghome_widget.dart' show HotdoghomeWidget;
import 'package:flutter/material.dart';

class HotdoghomeModel extends FlutterFlowModel<HotdoghomeWidget> {
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
