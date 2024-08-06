import '/flutter_flow/flutter_flow_util.dart';
import 'pay21_widget.dart' show Pay21Widget;
import 'package:flutter/material.dart';

class Pay21Model extends FlutterFlowModel<Pay21Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
