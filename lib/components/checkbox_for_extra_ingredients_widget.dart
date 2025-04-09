import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'checkbox_for_extra_ingredients_model.dart';
export 'checkbox_for_extra_ingredients_model.dart';

/// Este componente es para agregar los ingredientes extras a la orden o
/// pedido del producto deseado por el cliente
class CheckboxForExtraIngredientsWidget extends StatefulWidget {
  const CheckboxForExtraIngredientsWidget({
    super.key,
    required this.parameter1,
  });

  final double? parameter1;

  @override
  State<CheckboxForExtraIngredientsWidget> createState() =>
      _CheckboxForExtraIngredientsWidgetState();
}

class _CheckboxForExtraIngredientsWidgetState
    extends State<CheckboxForExtraIngredientsWidget> {
  late CheckboxForExtraIngredientsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxForExtraIngredientsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowCheckboxGroup(
      options: [
        formatNumber(
          widget.parameter1,
          formatType: FormatType.decimal,
          decimalType: DecimalType.automatic,
          currency: '+ ₡',
        )
      ],
      onChanged: (val) async {
        safeSetState(() => _model.checkboxGroupValues = val);
        FFAppState().totalBeforeAddingToCart =
            FFAppState().totalBeforeAddingToCart + widget.parameter1!;
        safeSetState(() {});
      },
      controller: _model.checkboxGroupValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      activeColor: Color(0xFF4B39EF),
      checkColor: Colors.white,
      checkboxBorderColor: Color(0xFF57636C),
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Outfit',
            color: Color(0xFF0F1113),
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
          ),
      itemPadding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
      checkboxBorderRadius: BorderRadius.circular(4.0),
      initialized: _model.checkboxGroupValues != null,
    );
  }
}
