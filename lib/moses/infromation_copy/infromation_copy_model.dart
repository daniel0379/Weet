import '/flutter_flow/flutter_flow_util.dart';
import 'infromation_copy_widget.dart' show InfromationCopyWidget;
import 'package:flutter/material.dart';

class InfromationCopyModel extends FlutterFlowModel<InfromationCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
