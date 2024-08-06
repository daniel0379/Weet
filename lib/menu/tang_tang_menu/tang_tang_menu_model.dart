import '/flutter_flow/flutter_flow_util.dart';
import 'tang_tang_menu_widget.dart' show TangTangMenuWidget;
import 'package:flutter/material.dart';

class TangTangMenuModel extends FlutterFlowModel<TangTangMenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
