import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
        ),
        FFRoute(
          name: 'TomatoJuice',
          path: '/tomatoJuice',
          builder: (context, params) => const TomatoJuiceWidget(),
        ),
        FFRoute(
          name: 'pizzahome',
          path: '/pizzahome',
          builder: (context, params) => const PizzahomeWidget(),
        ),
        FFRoute(
          name: 'pizzamenu',
          path: '/pizzamenu',
          builder: (context, params) => const PizzamenuWidget(),
        ),
        FFRoute(
          name: 'StrawberryJuice',
          path: '/strawberryJuice',
          builder: (context, params) => const StrawberryJuiceWidget(),
        ),
        FFRoute(
          name: 'KiwiJuice',
          path: '/kiwiJuice',
          builder: (context, params) => const KiwiJuiceWidget(),
        ),
        FFRoute(
          name: 'pizza',
          path: '/pizza',
          builder: (context, params) => const PizzaWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.int,
            ),
            phonenumber: params.getParam(
              'phonenumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'pizza2',
          path: '/pizza2',
          builder: (context, params) => const Pizza2Widget(),
        ),
        FFRoute(
          name: 'pizza3',
          path: '/pizza3',
          builder: (context, params) => const Pizza3Widget(),
        ),
        FFRoute(
          name: 'juicemenu',
          path: '/juicemenu',
          builder: (context, params) => const JuicemenuWidget(),
        ),
        FFRoute(
          name: 'tatoyakimenu',
          path: '/tatoyakimenu',
          builder: (context, params) => const TatoyakimenuWidget(),
        ),
        FFRoute(
          name: 'maratangmenu',
          path: '/maratangmenu',
          builder: (context, params) => const MaratangmenuWidget(),
        ),
        FFRoute(
          name: 'tatoyaki3',
          path: '/tatoyaki3',
          builder: (context, params) => const Tatoyaki3Widget(),
        ),
        FFRoute(
          name: 'tatoyaki1',
          path: '/tatoyaki1',
          builder: (context, params) => const Tatoyaki1Widget(),
        ),
        FFRoute(
          name: 'tatoyaki2',
          path: '/tatoyaki2',
          builder: (context, params) => const Tatoyaki2Widget(),
        ),
        FFRoute(
          name: 'maratang1',
          path: '/maratang1',
          builder: (context, params) => const Maratang1Widget(),
        ),
        FFRoute(
          name: 'maratang2',
          path: '/maratang2',
          builder: (context, params) => const Maratang2Widget(),
        ),
        FFRoute(
          name: 'maratang3',
          path: '/maratang3',
          builder: (context, params) => const Maratang3Widget(),
        ),
        FFRoute(
          name: 'maratanghome',
          path: '/maratanghome',
          builder: (context, params) => const MaratanghomeWidget(),
        ),
        FFRoute(
          name: 'tacoyakkihome',
          path: '/tacoyakkihome',
          builder: (context, params) => const TacoyakkihomeWidget(),
        ),
        FFRoute(
          name: 'juicehome',
          path: '/juicehome',
          builder: (context, params) => const JuicehomeWidget(),
        ),
        FFRoute(
          name: 'AlramSetting',
          path: '/alramSetting',
          builder: (context, params) => const AlramSettingWidget(),
        ),
        FFRoute(
          name: 'CustomerInfor',
          path: '/customerInfor',
          builder: (context, params) => const CustomerInforWidget(),
        ),
        FFRoute(
          name: 'MarketingAgree',
          path: '/marketingAgree',
          builder: (context, params) => const MarketingAgreeWidget(),
        ),
        FFRoute(
          name: 'Language',
          path: '/language',
          builder: (context, params) => const LanguageWidget(),
        ),
        FFRoute(
          name: 'report',
          path: '/report',
          builder: (context, params) => const ReportWidget(),
        ),
        FFRoute(
          name: 'accountInfor',
          path: '/accountInfor',
          builder: (context, params) => const AccountInforWidget(),
        ),
        FFRoute(
          name: 'etreInfor',
          path: '/etreInfor',
          builder: (context, params) => const EtreInforWidget(),
        ),
        FFRoute(
          name: 'location',
          path: '/location',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'location')
              : const LocationWidget(),
        ),
        FFRoute(
          name: 'profileEdit',
          path: '/profileEdit',
          builder: (context, params) => const ProfileEditWidget(),
        ),
        FFRoute(
          name: 'homepage',
          path: '/homepage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'homepage')
              : const HomepageWidget(),
        ),
        FFRoute(
          name: 'mytruck',
          path: '/mytruck',
          builder: (context, params) => const MytruckWidget(),
        ),
        FFRoute(
          name: 'logout2',
          path: '/logout2',
          builder: (context, params) => const Logout2Widget(),
        ),
        FFRoute(
          name: 'setting',
          path: '/setting',
          builder: (context, params) => const SettingWidget(),
        ),
        FFRoute(
          name: 'InfromationCopy',
          path: '/infromationCopy',
          builder: (context, params) => const InfromationCopyWidget(),
        ),
        FFRoute(
          name: 'helppingwords',
          path: '/helppingwords',
          builder: (context, params) => const HelppingwordsWidget(),
        ),
        FFRoute(
          name: 'MyPage',
          path: '/myPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'MyPage')
              : const MyPageWidget(),
        ),
        FFRoute(
          name: 'pay1',
          path: '/pay1',
          builder: (context, params) => const Pay1Widget(),
        ),
        FFRoute(
          name: 'pay2',
          path: '/pay2',
          builder: (context, params) => const Pay2Widget(),
        ),
        FFRoute(
          name: 'pay2-1',
          path: '/pay21',
          builder: (context, params) => const Pay21Widget(),
        ),
        FFRoute(
          name: 'pay2-2',
          path: '/pay22',
          builder: (context, params) => const Pay22Widget(),
        ),
        FFRoute(
          name: 'pay3',
          path: '/pay3',
          builder: (context, params) => const Pay3Widget(),
        ),
        FFRoute(
          name: 'searchingBar',
          path: '/searchingBar',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'searchingBar')
              : const SearchingBarWidget(),
        ),
        FFRoute(
          name: 'hotdoghome',
          path: '/hotdoghome',
          builder: (context, params) => const HotdoghomeWidget(),
        ),
        FFRoute(
          name: 'chickhome',
          path: '/chickhome',
          builder: (context, params) => const ChickhomeWidget(),
        ),
        FFRoute(
          name: 'bunsickhome',
          path: '/bunsickhome',
          builder: (context, params) => const BunsickhomeWidget(),
        ),
        FFRoute(
          name: 'jallattohome',
          path: '/jallattohome',
          builder: (context, params) => const JallattohomeWidget(),
        ),
        FFRoute(
          name: 'burgerhome',
          path: '/burgerhome',
          builder: (context, params) => const BurgerhomeWidget(),
        ),
        FFRoute(
          name: 'passward',
          path: '/passward',
          builder: (context, params) => const PasswardWidget(),
        ),
        FFRoute(
          name: 'burger1',
          path: '/burger1',
          builder: (context, params) => const Burger1Widget(),
        ),
        FFRoute(
          name: 'burger2',
          path: '/burger2',
          builder: (context, params) => const Burger2Widget(),
        ),
        FFRoute(
          name: 'burger3',
          path: '/burger3',
          builder: (context, params) => const Burger3Widget(),
        ),
        FFRoute(
          name: 'burger4',
          path: '/burger4',
          builder: (context, params) => const Burger4Widget(),
        ),
        FFRoute(
          name: 'icecream1',
          path: '/icecream1',
          builder: (context, params) => const Icecream1Widget(),
        ),
        FFRoute(
          name: 'icecream2',
          path: '/icecream2',
          builder: (context, params) => const Icecream2Widget(),
        ),
        FFRoute(
          name: 'icecream3',
          path: '/icecream3',
          builder: (context, params) => const Icecream3Widget(),
        ),
        FFRoute(
          name: 'icecream4',
          path: '/icecream4',
          builder: (context, params) => const Icecream4Widget(),
        ),
        FFRoute(
          name: 'bunsick1',
          path: '/bunsick1',
          builder: (context, params) => const Bunsick1Widget(),
        ),
        FFRoute(
          name: 'bunsick2',
          path: '/bunsick2',
          builder: (context, params) => const Bunsick2Widget(),
        ),
        FFRoute(
          name: 'bunsick3',
          path: '/bunsick3',
          builder: (context, params) => const Bunsick3Widget(),
        ),
        FFRoute(
          name: 'bunsick4',
          path: '/bunsick4',
          builder: (context, params) => const Bunsick4Widget(),
        ),
        FFRoute(
          name: 'chick1',
          path: '/chick1',
          builder: (context, params) => const Chick1Widget(),
        ),
        FFRoute(
          name: 'chick2',
          path: '/chick2',
          builder: (context, params) => const Chick2Widget(),
        ),
        FFRoute(
          name: 'chick3',
          path: '/chick3',
          builder: (context, params) => const Chick3Widget(),
        ),
        FFRoute(
          name: 'chick4',
          path: '/chick4',
          builder: (context, params) => const Chick4Widget(),
        ),
        FFRoute(
          name: 'bunsickcatagori',
          path: '/bunsickcatagori',
          builder: (context, params) => const BunsickcatagoriWidget(),
        ),
        FFRoute(
          name: 'cupbapcatagori',
          path: '/cupbapcatagori',
          builder: (context, params) => const CupbapcatagoriWidget(),
        ),
        FFRoute(
          name: 'pizzacatagori',
          path: '/pizzacatagori',
          builder: (context, params) => const PizzacatagoriWidget(),
        ),
        FFRoute(
          name: 'chickencatagori',
          path: '/chickencatagori',
          builder: (context, params) => const ChickencatagoriWidget(),
        ),
        FFRoute(
          name: 'hotdogcatagori',
          path: '/hotdogcatagori',
          builder: (context, params) => const HotdogcatagoriWidget(),
        ),
        FFRoute(
          name: 'chinacatagori',
          path: '/chinacatagori',
          builder: (context, params) => const ChinacatagoriWidget(),
        ),
        FFRoute(
          name: 'baveragecatagori',
          path: '/baveragecatagori',
          builder: (context, params) => const BaveragecatagoriWidget(),
        ),
        FFRoute(
          name: 'dessertcatagori',
          path: '/dessertcatagori',
          builder: (context, params) => const DessertcatagoriWidget(),
        ),
        FFRoute(
          name: 'cuopon',
          path: '/cuopon',
          builder: (context, params) => const CuoponWidget(),
        ),
        FFRoute(
          name: 'votemain',
          path: '/votemain',
          builder: (context, params) => const VotemainWidget(),
        ),
        FFRoute(
          name: 'voteresult82',
          path: '/voteresult82',
          builder: (context, params) => const Voteresult82Widget(),
        ),
        FFRoute(
          name: 'voteresult51',
          path: '/voteresult51',
          builder: (context, params) => const Voteresult51Widget(),
        ),
        FFRoute(
          name: 'voteresult9',
          path: '/voteresult9',
          builder: (context, params) => const Voteresult9Widget(),
        ),
        FFRoute(
          name: 'voteresult99',
          path: '/voteresult99',
          builder: (context, params) => const Voteresult99Widget(),
        ),
        FFRoute(
          name: 'voteresult64',
          path: '/voteresult64',
          builder: (context, params) => const Voteresult64Widget(),
        ),
        FFRoute(
          name: 'BullChickHome',
          path: '/bullChickHome',
          builder: (context, params) => const BullChickHomeWidget(),
        ),
        FFRoute(
          name: 'BullChickMenu',
          path: '/bullChickMenu',
          builder: (context, params) => const BullChickMenuWidget(),
        ),
        FFRoute(
          name: 'BullChick1',
          path: '/bullChick1',
          builder: (context, params) => const BullChick1Widget(),
        ),
        FFRoute(
          name: 'Bullchick2',
          path: '/bullchick2',
          builder: (context, params) => const Bullchick2Widget(),
        ),
        FFRoute(
          name: 'Bullchick3',
          path: '/bullchick3',
          builder: (context, params) => const Bullchick3Widget(),
        ),
        FFRoute(
          name: 'hotdogmenu',
          path: '/hotdogmenu',
          builder: (context, params) => const HotdogmenuWidget(),
        ),
        FFRoute(
          name: 'hamburgermenu',
          path: '/hamburgermenu',
          builder: (context, params) => const HamburgermenuWidget(),
        ),
        FFRoute(
          name: 'bunshikmenu',
          path: '/bunshikmenu',
          builder: (context, params) => const BunshikmenuWidget(),
        ),
        FFRoute(
          name: 'chikenmenu',
          path: '/chikenmenu',
          builder: (context, params) => const ChikenmenuWidget(),
        ),
        FFRoute(
          name: 'icecreammenu',
          path: '/icecreammenu',
          builder: (context, params) => const IcecreammenuWidget(),
        ),
        FFRoute(
          name: 'alram',
          path: '/alram',
          builder: (context, params) => const AlramWidget(),
        ),
        FFRoute(
          name: 'TangTangHome',
          path: '/tangTangHome',
          builder: (context, params) => const TangTangHomeWidget(),
        ),
        FFRoute(
          name: 'TangTangMenu',
          path: '/tangTangMenu',
          builder: (context, params) => const TangTangMenuWidget(),
        ),
        FFRoute(
          name: 'TangTang1',
          path: '/tangTang1',
          builder: (context, params) => const TangTang1Widget(),
        ),
        FFRoute(
          name: 'TangTang2',
          path: '/tangTang2',
          builder: (context, params) => const TangTang2Widget(),
        ),
        FFRoute(
          name: 'TangTang3',
          path: '/tangTang3',
          builder: (context, params) => const TangTang3Widget(),
        ),
        FFRoute(
          name: 'TangTang4',
          path: '/tangTang4',
          builder: (context, params) => const TangTang4Widget(),
        ),
        FFRoute(
          name: 'TangTang5',
          path: '/tangTang5',
          builder: (context, params) => const TangTang5Widget(),
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
            return '/login';
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
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
