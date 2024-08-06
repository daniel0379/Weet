import '/flutter_flow/flutter_flow_util.dart';
import 'tatoyaki1_widget.dart' show Tatoyaki1Widget;
import 'package:flutter/material.dart';

class Tatoyaki1Model extends FlutterFlowModel<Tatoyaki1Widget> {
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
