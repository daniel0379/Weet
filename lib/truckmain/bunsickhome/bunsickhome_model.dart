import '/flutter_flow/flutter_flow_util.dart';
import 'bunsickhome_widget.dart' show BunsickhomeWidget;
import 'package:flutter/material.dart';

class BunsickhomeModel extends FlutterFlowModel<BunsickhomeWidget> {
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
