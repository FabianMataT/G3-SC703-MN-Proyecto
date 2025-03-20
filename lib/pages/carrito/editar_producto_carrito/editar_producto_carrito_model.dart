import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editar_producto_carrito_widget.dart' show EditarProductoCarritoWidget;
import 'package:flutter/material.dart';

class EditarProductoCarritoModel
    extends FlutterFlowModel<EditarProductoCarritoWidget> {
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
