import '/flutter_flow/flutter_flow_util.dart';
import 'bull_chick_menu_widget.dart' show BullChickMenuWidget;
import 'package:flutter/material.dart';

class BullChickMenuModel extends FlutterFlowModel<BullChickMenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
