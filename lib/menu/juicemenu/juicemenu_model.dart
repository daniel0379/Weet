import '/flutter_flow/flutter_flow_util.dart';
import 'juicemenu_widget.dart' show JuicemenuWidget;
import 'package:flutter/material.dart';

class JuicemenuModel extends FlutterFlowModel<JuicemenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
