import '/flutter_flow/flutter_flow_util.dart';
import 'chick1_widget.dart' show Chick1Widget;
import 'package:flutter/material.dart';

class Chick1Model extends FlutterFlowModel<Chick1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
