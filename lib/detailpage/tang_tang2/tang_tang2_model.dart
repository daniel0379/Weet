import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang2_widget.dart' show TangTang2Widget;
import 'package:flutter/material.dart';

class TangTang2Model extends FlutterFlowModel<TangTang2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
