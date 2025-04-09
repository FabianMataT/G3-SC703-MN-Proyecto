import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _sinpeRef = prefs.getString('ff_sinpeRef')?.ref ?? _sinpeRef;
    });
    _safeInit(() {
      _efectivoRef = prefs.getString('ff_efectivoRef')?.ref ?? _efectivoRef;
    });
    _safeInit(() {
      _stateCompleto =
          prefs.getString('ff_stateCompleto')?.ref ?? _stateCompleto;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// En la pantalla de personalizacion del producto
  double _totalBeforeAddingToCart = 0.0;
  double get totalBeforeAddingToCart => _totalBeforeAddingToCart;
  set totalBeforeAddingToCart(double value) {
    _totalBeforeAddingToCart = value;
  }

  double _subtotalAmount = 0.0;
  double get subtotalAmount => _subtotalAmount;
  set subtotalAmount(double value) {
    _subtotalAmount = value;
  }

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;
  set totalAmount(double value) {
    _totalAmount = value;
  }

  double _subtotalBeforeAddingToCart = 0.0;
  double get subtotalBeforeAddingToCart => _subtotalBeforeAddingToCart;
  set subtotalBeforeAddingToCart(double value) {
    _subtotalBeforeAddingToCart = value;
  }

  int _productCount = 0;
  int get productCount => _productCount;
  set productCount(int value) {
    _productCount = value;
  }

  List<DocumentReference> _extraIngredients = [];
  List<DocumentReference> get extraIngredients => _extraIngredients;
  set extraIngredients(List<DocumentReference> value) {
    _extraIngredients = value;
  }

  void addToExtraIngredients(DocumentReference value) {
    extraIngredients.add(value);
  }

  void removeFromExtraIngredients(DocumentReference value) {
    extraIngredients.remove(value);
  }

  void removeAtIndexFromExtraIngredients(int index) {
    extraIngredients.removeAt(index);
  }

  void updateExtraIngredientsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    extraIngredients[index] = updateFn(_extraIngredients[index]);
  }

  void insertAtIndexInExtraIngredients(int index, DocumentReference value) {
    extraIngredients.insert(index, value);
  }

  List<double> _subtotalCart = [];
  List<double> get subtotalCart => _subtotalCart;
  set subtotalCart(List<double> value) {
    _subtotalCart = value;
  }

  void addToSubtotalCart(double value) {
    subtotalCart.add(value);
  }

  void removeFromSubtotalCart(double value) {
    subtotalCart.remove(value);
  }

  void removeAtIndexFromSubtotalCart(int index) {
    subtotalCart.removeAt(index);
  }

  void updateSubtotalCartAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    subtotalCart[index] = updateFn(_subtotalCart[index]);
  }

  void insertAtIndexInSubtotalCart(int index, double value) {
    subtotalCart.insert(index, value);
  }

  DocumentReference? _cartDocumentRef;
  DocumentReference? get cartDocumentRef => _cartDocumentRef;
  set cartDocumentRef(DocumentReference? value) {
    _cartDocumentRef = value;
  }

  bool _domicilio = false;
  bool get domicilio => _domicilio;
  set domicilio(bool value) {
    _domicilio = value;
  }

  bool _sinpe = false;
  bool get sinpe => _sinpe;
  set sinpe(bool value) {
    _sinpe = value;
  }

  DocumentReference? _sinpeRef =
      FirebaseFirestore.instance.doc('/payment_methods/Fkgm3EWTfoKybQMAfk1L');
  DocumentReference? get sinpeRef => _sinpeRef;
  set sinpeRef(DocumentReference? value) {
    _sinpeRef = value;
    value != null
        ? prefs.setString('ff_sinpeRef', value.path)
        : prefs.remove('ff_sinpeRef');
  }

  /// /payment_methods/Fkgm3EWTfoKybQMAfk1L
  DocumentReference? _efectivoRef =
      FirebaseFirestore.instance.doc('/payment_methods/Fkgm3EWTfoKybQMAfk1L');
  DocumentReference? get efectivoRef => _efectivoRef;
  set efectivoRef(DocumentReference? value) {
    _efectivoRef = value;
    value != null
        ? prefs.setString('ff_efectivoRef', value.path)
        : prefs.remove('ff_efectivoRef');
  }

  DocumentReference? _customerOrderRef;
  DocumentReference? get customerOrderRef => _customerOrderRef;
  set customerOrderRef(DocumentReference? value) {
    _customerOrderRef = value;
  }

  bool _enElLocal = false;
  bool get enElLocal => _enElLocal;
  set enElLocal(bool value) {
    _enElLocal = value;
  }

  List<String> _extraIngredientsName = [];
  List<String> get extraIngredientsName => _extraIngredientsName;
  set extraIngredientsName(List<String> value) {
    _extraIngredientsName = value;
  }

  void addToExtraIngredientsName(String value) {
    extraIngredientsName.add(value);
  }

  void removeFromExtraIngredientsName(String value) {
    extraIngredientsName.remove(value);
  }

  void removeAtIndexFromExtraIngredientsName(int index) {
    extraIngredientsName.removeAt(index);
  }

  void updateExtraIngredientsNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    extraIngredientsName[index] = updateFn(_extraIngredientsName[index]);
  }

  void insertAtIndexInExtraIngredientsName(int index, String value) {
    extraIngredientsName.insert(index, value);
  }

  /// /states/DLaVaLkgeRojS2UuT1z8
  DocumentReference? _stateCompleto =
      FirebaseFirestore.instance.doc('/states/DLaVaLkgeRojS2UuT1z8');
  DocumentReference? get stateCompleto => _stateCompleto;
  set stateCompleto(DocumentReference? value) {
    _stateCompleto = value;
    value != null
        ? prefs.setString('ff_stateCompleto', value.path)
        : prefs.remove('ff_stateCompleto');
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  String _categoriaSeleccionada = '';
  String get categoriaSeleccionada => _categoriaSeleccionada;
  set categoriaSeleccionada(String value) {
    _categoriaSeleccionada = value;
  }

  DocumentReference? _categoriaRefSeleccionada;
  DocumentReference? get categoriaRefSeleccionada => _categoriaRefSeleccionada;
  set categoriaRefSeleccionada(DocumentReference? value) {
    _categoriaRefSeleccionada = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
