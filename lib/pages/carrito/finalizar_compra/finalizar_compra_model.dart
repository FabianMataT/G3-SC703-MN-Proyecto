import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'finalizar_compra_widget.dart' show FinalizarCompraWidget;
import 'package:flutter/material.dart';

class FinalizarCompraModel extends FlutterFlowModel<FinalizarCompraWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for local widget.
  bool? localValue;
  // State field(s) for domicilio widget.
  bool? domicilioValue;
  // State field(s) for direccionDomcilioTxtF widget.
  FocusNode? direccionDomcilioTxtFFocusNode;
  TextEditingController? direccionDomcilioTxtFTextController;
  String? Function(BuildContext, String?)?
      direccionDomcilioTxtFTextControllerValidator;
  // State field(s) for efectivoCheckbox widget.
  bool? efectivoCheckboxValue;
  // State field(s) for sinpeCheckbox widget.
  bool? sinpeCheckboxValue;
  // State field(s) for comprobanteSinpeTxtF widget.
  FocusNode? comprobanteSinpeTxtFFocusNode;
  TextEditingController? comprobanteSinpeTxtFTextController;
  String? Function(BuildContext, String?)?
      comprobanteSinpeTxtFTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    direccionDomcilioTxtFFocusNode?.dispose();
    direccionDomcilioTxtFTextController?.dispose();

    comprobanteSinpeTxtFFocusNode?.dispose();
    comprobanteSinpeTxtFTextController?.dispose();
  }
}
