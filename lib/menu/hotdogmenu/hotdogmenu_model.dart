import '/flutter_flow/flutter_flow_util.dart';
import 'hotdogmenu_widget.dart' show HotdogmenuWidget;
import 'package:flutter/material.dart';

class HotdogmenuModel extends FlutterFlowModel<HotdogmenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
