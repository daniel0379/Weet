import '/flutter_flow/flutter_flow_util.dart';
import 'marketing_agree_widget.dart' show MarketingAgreeWidget;
import 'package:flutter/material.dart';

class MarketingAgreeModel extends FlutterFlowModel<MarketingAgreeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
