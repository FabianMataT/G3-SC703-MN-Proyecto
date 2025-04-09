import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LogiRegistroWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LogiRegistroWidget(),
        ),
        FFRoute(
          name: ListadoComandaWidget.routeName,
          path: ListadoComandaWidget.routePath,
          builder: (context, params) => ListadoComandaWidget(),
        ),
        FFRoute(
          name: AgregarProductoWidget.routeName,
          path: AgregarProductoWidget.routePath,
          asyncParams: {
            'productDocumentID':
                getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarProductoWidget(
            productDocumentID: params.getParam(
              'productDocumentID',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CarritoWidget.routeName,
          path: CarritoWidget.routePath,
          builder: (context, params) => CarritoWidget(),
        ),
        FFRoute(
          name: FinalizarCompraWidget.routeName,
          path: FinalizarCompraWidget.routePath,
          builder: (context, params) => FinalizarCompraWidget(),
        ),
        FFRoute(
          name: PedidosWidget.routeName,
          path: PedidosWidget.routePath,
          builder: (context, params) => PedidosWidget(),
        ),
        FFRoute(
          name: PedidosDetalleWidget.routeName,
          path: PedidosDetalleWidget.routePath,
          asyncParams: {
            'orderDocumentID':
                getDoc(['customer_orders'], CustomerOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => PedidosDetalleWidget(
            orderDocumentID: params.getParam(
              'orderDocumentID',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: LogiRegistroWidget.routeName,
          path: LogiRegistroWidget.routePath,
          builder: (context, params) => LogiRegistroWidget(),
        ),
        FFRoute(
          name: ReportesWidget.routeName,
          path: ReportesWidget.routePath,
          builder: (context, params) => ReportesWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: GestionDeProductosWidget.routeName,
          path: GestionDeProductosWidget.routePath,
          builder: (context, params) => GestionDeProductosWidget(),
        ),
        FFRoute(
          name: EditarProductoCarritoWidget.routeName,
          path: EditarProductoCarritoWidget.routePath,
          asyncParams: {
            'carritoDocumentID':
                getDoc(['carrito'], CarritoRecord.fromSnapshot),
          },
          builder: (context, params) => EditarProductoCarritoWidget(
            carritoDocumentID: params.getParam(
              'carritoDocumentID',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CategoriasWidget.routeName,
          path: CategoriasWidget.routePath,
          builder: (context, params) => CategoriasWidget(),
        ),
        FFRoute(
          name: ListadoProductosWidget.routeName,
          path: ListadoProductosWidget.routePath,
          builder: (context, params) => ListadoProductosWidget(
            categoryRef: params.getParam(
              'categoryRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['categories'],
            ),
          ),
        ),
        FFRoute(
          name: DetalleProductoWidget.routeName,
          path: DetalleProductoWidget.routePath,
          builder: (context, params) => DetalleProductoWidget(
            producto: params.getParam(
              'producto',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: PaginaGraficosWidget.routeName,
          path: PaginaGraficosWidget.routePath,
          builder: (context, params) => PaginaGraficosWidget(),
        ),
        FFRoute(
          name: GraficosTipoentregaWidget.routeName,
          path: GraficosTipoentregaWidget.routePath,
          builder: (context, params) => GraficosTipoentregaWidget(),
        ),
        FFRoute(
          name: ProductosMasvendidosWidget.routeName,
          path: ProductosMasvendidosWidget.routePath,
          builder: (context, params) => ProductosMasvendidosWidget(),
        ),
        FFRoute(
          name: ProductosMenosvendidosWidget.routeName,
          path: ProductosMenosvendidosWidget.routePath,
          builder: (context, params) => ProductosMenosvendidosWidget(),
        ),
        FFRoute(
          name: ProductosVendidosWidget.routeName,
          path: ProductosVendidosWidget.routePath,
          builder: (context, params) => ProductosVendidosWidget(),
        ),
        FFRoute(
          name: DetalleComandaWidget.routeName,
          path: DetalleComandaWidget.routePath,
          builder: (context, params) => DetalleComandaWidget(
            ordenParam: params.getParam(
              'ordenParam',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['customer_orders'],
            ),
          ),
        ),
        FFRoute(
          name: IndexWidget.routeName,
          path: IndexWidget.routePath,
          builder: (context, params) => IndexWidget(),
        ),
        FFRoute(
          name: CreateWidget.routeName,
          path: CreateWidget.routePath,
          builder: (context, params) => CreateWidget(),
        ),
        FFRoute(
          name: EditWidget.routeName,
          path: EditWidget.routePath,
          asyncParams: {
            'tableOrderDoc':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => EditWidget(
            tableOrderDoc: params.getParam(
              'tableOrderDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AgregarOrdenWidget.routeName,
          path: AgregarOrdenWidget.routePath,
          asyncParams: {
            'productRef': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarOrdenWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MenuWidget.routeName,
          path: MenuWidget.routePath,
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: EditarOrdenWidget.routeName,
          path: EditarOrdenWidget.routePath,
          asyncParams: {
            'carritoDocument': getDoc(['carrito'], CarritoRecord.fromSnapshot),
          },
          builder: (context, params) => EditarOrdenWidget(
            carritoDocument: params.getParam(
              'carritoDocument',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowOrdenWidget.routeName,
          path: ShowOrdenWidget.routePath,
          asyncParams: {
            'tableOrder':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => ShowOrdenWidget(
            tableOrder: params.getParam(
              'tableOrder',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PedidosDetalleLocalWidget.routeName,
          path: PedidosDetalleLocalWidget.routePath,
          asyncParams: {
            'tableDocumentID':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => PedidosDetalleLocalWidget(
            tableDocumentID: params.getParam(
              'tableDocumentID',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ShowProductInOrderWidget.routeName,
          path: ShowProductInOrderWidget.routePath,
          asyncParams: {
            'tableOrderDetailsDoc': getDoc(
                ['table_order_details'], TableOrderDetailsRecord.fromSnapshot),
            'tableOrderDoc':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => ShowProductInOrderWidget(
            tableOrderDetailsDoc: params.getParam(
              'tableOrderDetailsDoc',
              ParamType.Document,
            ),
            tableOrderDoc: params.getParam(
              'tableOrderDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditarProductoOrdenWidget.routeName,
          path: EditarProductoOrdenWidget.routePath,
          asyncParams: {
            'tableOrderDetailsDoc': getDoc(
                ['table_order_details'], TableOrderDetailsRecord.fromSnapshot),
            'tableOrderDoc':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
          },
          builder: (context, params) => EditarProductoOrdenWidget(
            tableOrderDetailsDoc: params.getParam(
              'tableOrderDetailsDoc',
              ParamType.Document,
            ),
            tableOrderDoc: params.getParam(
              'tableOrderDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AgregarProductoOrdenWidget.routeName,
          path: AgregarProductoOrdenWidget.routePath,
          asyncParams: {
            'tableOrderDoc':
                getDoc(['table_orders'], TableOrdersRecord.fromSnapshot),
            'productoDoc': getDoc(['products'], ProductsRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarProductoOrdenWidget(
            tableOrderDoc: params.getParam(
              'tableOrderDoc',
              ParamType.Document,
            ),
            productoDoc: params.getParam(
              'productoDoc',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/logiRegistro';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
