import '/flutter_flow/flutter_flow_util.dart';
import 'icecream4_widget.dart' show Icecream4Widget;
import 'package:flutter/material.dart';

class Icecream4Model extends FlutterFlowModel<Icecream4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
