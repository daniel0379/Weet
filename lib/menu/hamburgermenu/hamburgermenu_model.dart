import '/flutter_flow/flutter_flow_util.dart';
import 'hamburgermenu_widget.dart' show HamburgermenuWidget;
import 'package:flutter/material.dart';

class HamburgermenuModel extends FlutterFlowModel<HamburgermenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
