import '/flutter_flow/flutter_flow_util.dart';
import 'my_page_widget.dart' show MyPageWidget;
import 'package:flutter/material.dart';

class MyPageModel extends FlutterFlowModel<MyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
