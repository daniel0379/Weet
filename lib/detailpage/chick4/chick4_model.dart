import '/flutter_flow/flutter_flow_util.dart';
import 'chick4_widget.dart' show Chick4Widget;
import 'package:flutter/material.dart';

class Chick4Model extends FlutterFlowModel<Chick4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
