import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'searching_bar_widget.dart' show SearchingBarWidget;
import 'package:flutter/material.dart';

class SearchingBarModel extends FlutterFlowModel<SearchingBarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FoodtrucksRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
