import '/flutter_flow/flutter_flow_util.dart';
import 'tomato_juice_widget.dart' show TomatoJuiceWidget;
import 'package:flutter/material.dart';

class TomatoJuiceModel extends FlutterFlowModel<TomatoJuiceWidget> {
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
