import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'agregar_producto_orden_widget.dart' show AgregarProductoOrdenWidget;
import 'package:flutter/material.dart';

class AgregarProductoOrdenModel
    extends FlutterFlowModel<AgregarProductoOrdenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
