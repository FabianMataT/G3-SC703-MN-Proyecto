import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_widget.dart' show EditWidget;
import 'package:flutter/material.dart';

class EditModel extends FlutterFlowModel<EditWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for local widget.
  bool? localValue;
  // State field(s) for domicilio widget.
  bool? domicilioValue;
  // State field(s) for nombreClienteTxtF widget.
  FocusNode? nombreClienteTxtFFocusNode;
  TextEditingController? nombreClienteTxtFTextController;
  String? Function(BuildContext, String?)?
      nombreClienteTxtFTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for efectivoCheckbox widget.
  bool? efectivoCheckboxValue;
  // State field(s) for sinpeCheckbox widget.
  bool? sinpeCheckboxValue;
  // State field(s) for comprobanteSinpeTxtF widget.
  FocusNode? comprobanteSinpeTxtFFocusNode;
  TextEditingController? comprobanteSinpeTxtFTextController;
  String? Function(BuildContext, String?)?
      comprobanteSinpeTxtFTextControllerValidator;
  // State field(s) for pagoConfirmadoCheckbox widget.
  bool? pagoConfirmadoCheckboxValue;
  // State field(s) for pagoPendienteCheckbox widget.
  bool? pagoPendienteCheckboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    nombreClienteTxtFFocusNode?.dispose();
    nombreClienteTxtFTextController?.dispose();

    comprobanteSinpeTxtFFocusNode?.dispose();
    comprobanteSinpeTxtFTextController?.dispose();
  }
}
