import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang1_widget.dart' show TangTang1Widget;
import 'package:flutter/material.dart';

class TangTang1Model extends FlutterFlowModel<TangTang1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
