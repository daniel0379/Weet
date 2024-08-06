import '/flutter_flow/flutter_flow_util.dart';
import 'bunshikmenu_widget.dart' show BunshikmenuWidget;
import 'package:flutter/material.dart';

class BunshikmenuModel extends FlutterFlowModel<BunshikmenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
