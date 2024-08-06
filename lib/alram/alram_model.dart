import '/flutter_flow/flutter_flow_util.dart';
import 'alram_widget.dart' show AlramWidget;
import 'package:flutter/material.dart';

class AlramModel extends FlutterFlowModel<AlramWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
