import '/flutter_flow/flutter_flow_util.dart';
import 'tatoyakimenu_widget.dart' show TatoyakimenuWidget;
import 'package:flutter/material.dart';

class TatoyakimenuModel extends FlutterFlowModel<TatoyakimenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
