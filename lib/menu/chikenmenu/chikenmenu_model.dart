import '/flutter_flow/flutter_flow_util.dart';
import 'chikenmenu_widget.dart' show ChikenmenuWidget;
import 'package:flutter/material.dart';

class ChikenmenuModel extends FlutterFlowModel<ChikenmenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
