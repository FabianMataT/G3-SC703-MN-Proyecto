import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'checkbox_for_extra_ingredients_widget.dart'
    show CheckboxForExtraIngredientsWidget;
import 'package:flutter/material.dart';

class CheckboxForExtraIngredientsModel
    extends FlutterFlowModel<CheckboxForExtraIngredientsWidget> {
  ///  Local state fields for this component.
  /// price
  double? option;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
