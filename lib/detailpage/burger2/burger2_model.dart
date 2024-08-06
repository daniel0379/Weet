import '/flutter_flow/flutter_flow_util.dart';
import 'burger2_widget.dart' show Burger2Widget;
import 'package:flutter/material.dart';

class Burger2Model extends FlutterFlowModel<Burger2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
