import '/flutter_flow/flutter_flow_util.dart';
import 'alram_setting_widget.dart' show AlramSettingWidget;
import 'package:flutter/material.dart';

class AlramSettingModel extends FlutterFlowModel<AlramSettingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
