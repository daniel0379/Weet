import '/flutter_flow/flutter_flow_util.dart';
import 'tatoyaki3_widget.dart' show Tatoyaki3Widget;
import 'package:flutter/material.dart';

class Tatoyaki3Model extends FlutterFlowModel<Tatoyaki3Widget> {
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
