import '/flutter_flow/flutter_flow_util.dart';
import 'tatoyaki2_widget.dart' show Tatoyaki2Widget;
import 'package:flutter/material.dart';

class Tatoyaki2Model extends FlutterFlowModel<Tatoyaki2Widget> {
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
