import '/flutter_flow/flutter_flow_util.dart';
import 'maratanghome_widget.dart' show MaratanghomeWidget;
import 'package:flutter/material.dart';

class MaratanghomeModel extends FlutterFlowModel<MaratanghomeWidget> {
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
