import '/flutter_flow/flutter_flow_util.dart';
import 'account_infor_widget.dart' show AccountInforWidget;
import 'package:flutter/material.dart';

class AccountInforModel extends FlutterFlowModel<AccountInforWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
