import '/flutter_flow/flutter_flow_util.dart';
import 'maratangmenu_widget.dart' show MaratangmenuWidget;
import 'package:flutter/material.dart';

class MaratangmenuModel extends FlutterFlowModel<MaratangmenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
