import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang3_widget.dart' show TangTang3Widget;
import 'package:flutter/material.dart';

class TangTang3Model extends FlutterFlowModel<TangTang3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
