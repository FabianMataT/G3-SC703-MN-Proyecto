import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'pedidos_detalle_local_widget.dart' show PedidosDetalleLocalWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PedidosDetalleLocalModel
    extends FlutterFlowModel<PedidosDetalleLocalWidget> {
  ///  State fields for stateful widgets in this page.

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
