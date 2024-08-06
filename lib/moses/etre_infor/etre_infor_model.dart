import '/flutter_flow/flutter_flow_util.dart';
import 'etre_infor_widget.dart' show EtreInforWidget;
import 'package:flutter/material.dart';

class EtreInforModel extends FlutterFlowModel<EtreInforWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
