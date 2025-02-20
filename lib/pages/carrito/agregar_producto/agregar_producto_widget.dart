import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'agregar_producto_model.dart';
export 'agregar_producto_model.dart';

/// Agregar al carrito o orden y personalizar el producto
class AgregarProductoWidget extends StatefulWidget {
  const AgregarProductoWidget({super.key});

  static String routeName = 'AgregarProducto';
  static String routePath = '/agregarProducto';

  @override
  State<AgregarProductoWidget> createState() => _AgregarProductoWidgetState();
}

class _AgregarProductoWidgetState extends State<AgregarProductoWidget> {
  late AgregarProductoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgregarProductoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).navColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          'https://picsum.photos/seed/654/600',
                          width: 62.1,
                          height: 63.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'SMOKER\'S',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Inicio',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Menu',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      letterSpacing: 0.0,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 100.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).smokers3,
                        icon: FaIcon(
                          FontAwesomeIcons.shoppingBag,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://hips.hearstapps.com/hmg-prod/images/smash-burger-elle-gourmet-2-1669737278.jpg?crop=0.961111111111111xw:1xh;center,top&resize=1200:*',
                            width: double.infinity,
                            height: 230.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Smoker\'s smash burger ',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                        child: Text(
                          ' ₡7.000',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        thickness: 2.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        color: Color(0xFFDBE2E7),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Description',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 0.0),
                        child: Text(
                          'Dos jugosas tortas de carne 100% angus, queso derretido, cebolla caramelizada, pepinillos, nuestra exclusiva salsa especial y pan brioche tostado',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Divider(
                        height: 20.0,
                        thickness: 2.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        color: Color(0xFFDBE2E7),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Personaliza tu comida',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Ingredientes Extras',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(-0.9, 0.0),
                                child: Text(
                                  'Tortas',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowCheckboxGroup(
                              options: ['+ 1  ₡600', '+ 2 ₡1000'],
                              onChanged: (val) => safeSetState(
                                  () => _model.checkboxGroupValues1 = val),
                              controller:
                                  _model.checkboxGroupValueController1 ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: Color(0xFF4B39EF),
                              checkColor: Colors.white,
                              checkboxBorderColor: Color(0xFF57636C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              itemPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: _model.checkboxGroupValues1 != null,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(-0.9, 0.0),
                                child: Text(
                                  'Lechuga',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowCheckboxGroup(
                              options: ['extra de lechuga ₡600'],
                              onChanged: (val) => safeSetState(
                                  () => _model.checkboxGroupValues2 = val),
                              controller:
                                  _model.checkboxGroupValueController2 ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: Color(0xFF4B39EF),
                              checkColor: Colors.white,
                              checkboxBorderColor: Color(0xFF57636C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              itemPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: _model.checkboxGroupValues2 != null,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(-0.9, 0.0),
                                child: Text(
                                  'Queso',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowCheckboxGroup(
                              options: ['extra de queso ₡600'],
                              onChanged: (val) => safeSetState(
                                  () => _model.checkboxGroupValues3 = val),
                              controller:
                                  _model.checkboxGroupValueController3 ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: Color(0xFF4B39EF),
                              checkColor: Colors.white,
                              checkboxBorderColor: Color(0xFF57636C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              itemPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: _model.checkboxGroupValues3 != null,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(-0.9, 0.0),
                                child: Text(
                                  'Tomate',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF57636C),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowCheckboxGroup(
                              options: ['extra de tomate ₡600'],
                              onChanged: (val) => safeSetState(
                                  () => _model.checkboxGroupValues4 = val),
                              controller:
                                  _model.checkboxGroupValueController4 ??=
                                      FormFieldController<List<String>>(
                                [],
                              ),
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                              checkboxBorderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: _model.checkboxGroupValues4 != null,
                            ),
                            Divider(
                              height: 20.0,
                              thickness: 2.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 24.0),
                            child: Container(
                              width: 160.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Color(0xFFDBE2E7),
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => Icon(
                                  Icons.remove_rounded,
                                  color: enabled
                                      ? Color(0xFF57636C)
                                      : Color(0xFFDBE2E7),
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => Icon(
                                  Icons.add_rounded,
                                  color: enabled
                                      ? Color(0xFF4B39EF)
                                      : Color(0xFFDBE2E7),
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                count: _model.countControllerValue ??= 1,
                                updateCount: (count) => safeSetState(
                                    () => _model.countControllerValue = count),
                                stepSize: 1,
                                minimum: 1,
                                maximum: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20.0,
                        thickness: 2.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        color: Color(0xFFDBE2E7),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Añadir a mi orden',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF0F1113),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
