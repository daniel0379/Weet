import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang4_widget.dart' show TangTang4Widget;
import 'package:flutter/material.dart';

class TangTang4Model extends FlutterFlowModel<TangTang4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
