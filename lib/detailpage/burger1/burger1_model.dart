import '/flutter_flow/flutter_flow_util.dart';
import 'burger1_widget.dart' show Burger1Widget;
import 'package:flutter/material.dart';

class Burger1Model extends FlutterFlowModel<Burger1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
