import '/flutter_flow/flutter_flow_util.dart';
import 'cuopon_widget.dart' show CuoponWidget;
import 'package:flutter/material.dart';

class CuoponModel extends FlutterFlowModel<CuoponWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
