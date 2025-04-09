import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'pedidos_detalle_widget.dart' show PedidosDetalleWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PedidosDetalleModel extends FlutterFlowModel<PedidosDetalleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombreEstados widget.
  String? nombreEstadosValue;
  FormFieldController<String>? nombreEstadosValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
