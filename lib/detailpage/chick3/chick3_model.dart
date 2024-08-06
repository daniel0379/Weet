import '/flutter_flow/flutter_flow_util.dart';
import 'chick3_widget.dart' show Chick3Widget;
import 'package:flutter/material.dart';

class Chick3Model extends FlutterFlowModel<Chick3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
