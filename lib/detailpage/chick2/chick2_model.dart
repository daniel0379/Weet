import '/flutter_flow/flutter_flow_util.dart';
import 'chick2_widget.dart' show Chick2Widget;
import 'package:flutter/material.dart';

class Chick2Model extends FlutterFlowModel<Chick2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
