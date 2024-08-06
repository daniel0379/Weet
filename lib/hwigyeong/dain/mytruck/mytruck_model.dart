import '/flutter_flow/flutter_flow_util.dart';
import 'mytruck_widget.dart' show MytruckWidget;
import 'package:flutter/material.dart';

class MytruckModel extends FlutterFlowModel<MytruckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
