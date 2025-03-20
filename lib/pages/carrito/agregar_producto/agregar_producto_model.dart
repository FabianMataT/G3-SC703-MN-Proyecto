import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'agregar_producto_widget.dart' show AgregarProductoWidget;
import 'package:flutter/material.dart';

class AgregarProductoModel extends FlutterFlowModel<AgregarProductoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<ExtraIngredientsRecord, bool> checkboxValueMap = {};
  List<ExtraIngredientsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for addicionalDescription widget.
  FocusNode? addicionalDescriptionFocusNode;
  TextEditingController? addicionalDescriptionTextController;
  String? Function(BuildContext, String?)?
      addicionalDescriptionTextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addicionalDescriptionFocusNode?.dispose();
    addicionalDescriptionTextController?.dispose();
  }
}
