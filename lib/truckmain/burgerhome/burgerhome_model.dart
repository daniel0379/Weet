import '/flutter_flow/flutter_flow_util.dart';
import 'burgerhome_widget.dart' show BurgerhomeWidget;
import 'package:flutter/material.dart';

class BurgerhomeModel extends FlutterFlowModel<BurgerhomeWidget> {
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
