import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
          appStateNotifier.loggedIn ? const NavBarPage() : const ListFilmWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const ListFilmWidget(),
        ),
        FFRoute(
          name: 'ListEvent',
          path: '/listEvent',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ListEvent')
              : const NavBarPage(
                  initialPage: 'ListEvent',
                  page: ListEventWidget(),
                ),
        ),
        FFRoute(
          name: 'CreateEvent',
          path: '/createEvent',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CreateEventWidget(),
          ),
        ),
        FFRoute(
          name: 'createfilm',
          path: '/createfilm',
          builder: (context, params) => const CreatefilmWidget(),
        ),
        FFRoute(
          name: 'List_film',
          path: '/listFilm',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'List_film')
              : NavBarPage(
                  initialPage: 'List_film',
                  page: ListFilmWidget(
                    categorieComedie: params.getParam(
                      'categorieComedie',
                      ParamType.String,
                    ),
                    categorieRem: params.getParam(
                      'categorieRem',
                      ParamType.String,
                    ),
                    categorieAct: params.getParam(
                      'categorieAct',
                      ParamType.String,
                    ),
                  ),
                ),
        ),
        FFRoute(
          name: 'EditEventCopy',
          path: '/editEventCopy',
          builder: (context, params) => const EditEventCopyWidget(),
        ),
        FFRoute(
          name: 'Create_Reclamation',
          path: '/createReclamation',
          builder: (context, params) => const CreateReclamationWidget(),
        ),
        FFRoute(
          name: 'update',
          path: '/update',
          builder: (context, params) => UpdateWidget(
            t1: params.getParam(
              't1',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Film'],
            ),
          ),
        ),
        FFRoute(
          name: 'editeventCopym',
          path: '/editeventCopym',
          builder: (context, params) => EditeventCopymWidget(
            evenementRef: params.getParam(
              'evenementRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evenement'],
            ),
          ),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'readsale',
          path: '/readsale',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ReadsaleWidget(
              saleref: params.getParam(
                'saleref',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['sallle'],
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'RegisterPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'HomePage2',
          path: '/homePage2',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage2')
              : const NavBarPage(
                  initialPage: 'HomePage2',
                  page: HomePage2Widget(),
                ),
        ),
        FFRoute(
          name: 'CreateSale',
          path: '/createSale',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: CreateSaleWidget(),
          ),
        ),
        FFRoute(
          name: 'places',
          path: '/places',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PlacesWidget(
              planRef: params.getParam(
                'planRef',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['planning'],
              ),
              salleRef: params.getParam(
                'salleRef',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['sallle'],
              ),
              nbrTickets: params.getParam(
                'nbrTickets',
                ParamType.int,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'updatePlanning',
          path: '/updatePlanning',
          builder: (context, params) => UpdatePlanningWidget(
            t1: params.getParam(
              't1',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Film'],
            ),
          ),
        ),
        FFRoute(
          name: 'profil',
          path: '/profil',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'profil')
              : const ProfilWidget(),
        ),
        FFRoute(
          name: 'list_reservation',
          path: '/listReservation',
          builder: (context, params) => const ListReservationWidget(),
        ),
        FFRoute(
          name: 'List_Reclamation',
          path: '/listReclamation',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ListReclamationWidget(),
          ),
        ),
        FFRoute(
          name: 'add_reservation',
          path: '/addReservation',
          builder: (context, params) => AddReservationWidget(
            filmsRefs: params.getParam<DocumentReference>(
              'filmsRefs',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['Film'],
            ),
          ),
        ),
        FFRoute(
          name: 'edit_reservation',
          path: '/editReservation',
          builder: (context, params) => EditReservationWidget(
            refre: params.getParam(
              'refre',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reservation'],
            ),
          ),
        ),
        FFRoute(
          name: 'inspectevent',
          path: '/inspectevent',
          builder: (context, params) => InspecteventWidget(
            docref: params.getParam(
              'docref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evenement'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'eventlikedby',
          path: '/eventlikedby',
          asyncParams: {
            'likesref': getDoc(['evenement'], EvenementRecord.fromSnapshot),
          },
          builder: (context, params) => EventlikedbyWidget(
            likesref: params.getParam(
              'likesref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Update_Reclamation',
          path: '/updateReclamation',
          builder: (context, params) => UpdateReclamationWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reclamation'],
            ),
          ),
        ),
        FFRoute(
          name: 'chat',
          path: '/chat',
          builder: (context, params) => const ChatWidget(),
        ),
        FFRoute(
          name: 'createsalle2',
          path: '/createsalle2',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: Createsalle2Widget(),
          ),
        ),
        FFRoute(
          name: 'addcategories',
          path: '/addcategories',
          builder: (context, params) => AddcategoriesWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            images: params.getParam<String>(
              'images',
              ParamType.String,
              isList: true,
            ),
            size: params.getParam(
              'size',
              ParamType.String,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Search_Reservation',
          path: '/searchReservation',
          builder: (context, params) => const SearchReservationWidget(),
        ),
        FFRoute(
          name: 'Statistiques_Reservations',
          path: '/statistiquesReservations',
          builder: (context, params) => const StatistiquesReservationsWidget(),
        ),
        FFRoute(
          name: 'readsalle12',
          path: '/readsalle12',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: Readsalle12Widget(),
          ),
        ),
        FFRoute(
          name: 'upplupll',
          path: '/upplupll',
          builder: (context, params) => UpplupllWidget(
            t2: params.getParam(
              't2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['planning'],
            ),
            s2: params.getParam(
              's2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
          ),
        ),
        FFRoute(
          name: 'editcategories',
          path: '/editcategories',
          builder: (context, params) => EditcategoriesWidget(
            salllonref: params.getParam(
              'salllonref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
          ),
        ),
        FFRoute(
          name: 'EventList',
          path: '/eventList',
          builder: (context, params) => const EventListWidget(),
        ),
        FFRoute(
          name: 'UserProfile',
          path: '/userProfile',
          builder: (context, params) => const UserProfileWidget(),
        ),
        FFRoute(
          name: 'savedevents',
          path: '/savedevents',
          builder: (context, params) => const SavedeventsWidget(),
        ),
        FFRoute(
          name: 'UpdateUserProfile',
          path: '/updateUserProfile',
          builder: (context, params) => const UpdateUserProfileWidget(),
        ),
        FFRoute(
          name: 'ListPlanningsFilm',
          path: '/listPlanningsFilm',
          builder: (context, params) => const ListPlanningsFilmWidget(),
        ),
        FFRoute(
          name: 'listCategories12',
          path: '/listCategories12',
          builder: (context, params) => ListCategories12Widget(
            izer: params.getParam(
              'izer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
          ),
        ),
        FFRoute(
          name: 'ChangerMotDePasse',
          path: '/changerMotDePasse',
          builder: (context, params) => const ChangerMotDePasseWidget(),
        ),
        FFRoute(
          name: 'listCategories12Copy',
          path: '/listCategories12Copy',
          builder: (context, params) => ListCategories12CopyWidget(
            izer: params.getParam(
              'izer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
          ),
        ),
        FFRoute(
          name: 'notifications',
          path: '/notifications',
          builder: (context, params) => const NotificationsWidget(),
        ),
        FFRoute(
          name: 'HomePage2Copy',
          path: '/homePage2Copy',
          builder: (context, params) => const HomePage2CopyWidget(),
        ),
        FFRoute(
          name: 'dasbordadmin',
          path: '/dasbordadmin',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: DasbordadminWidget(),
          ),
        ),
        FFRoute(
          name: 'recommandme',
          path: '/recommandme',
          builder: (context, params) => const RecommandmeWidget(),
        ),
        FFRoute(
          name: 'upplupllEvent',
          path: '/upplupllEvent',
          builder: (context, params) => UpplupllEventWidget(
            t2: params.getParam(
              't2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['planning'],
            ),
            s2: params.getParam(
              's2',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
          ),
        ),
        FFRoute(
          name: 'filmdetails',
          path: '/filmdetails',
          builder: (context, params) => FilmdetailsWidget(
            imageessss: params.getParam<String>(
              'imageessss',
              ParamType.String,
              isList: true,
            ),
            titre: params.getParam(
              'titre',
              ParamType.String,
            ),
            age: params.getParam(
              'age',
              ParamType.String,
            ),
            desc: params.getParam(
              'desc',
              ParamType.String,
            ),
            categorie: params.getParam(
              'categorie',
              ParamType.String,
            ),
            duree: params.getParam(
              'duree',
              ParamType.String,
            ),
            date: params.getParam(
              'date',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'recoverPassword',
          path: '/recoverPassword',
          builder: (context, params) => const RecoverPasswordWidget(),
        ),
        FFRoute(
          name: 'whatsapp',
          path: '/whatsapp',
          builder: (context, params) => const WhatsappWidget(),
        ),
        FFRoute(
          name: 'updatePlanningEvent',
          path: '/updatePlanningEvent',
          builder: (context, params) => UpdatePlanningEventWidget(
            t1: params.getParam(
              't1',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['evenement'],
            ),
          ),
        ),
        FFRoute(
          name: 'tickets',
          path: '/tickets',
          builder: (context, params) => TicketsWidget(
            nbroftickets: params.getParam(
              'nbroftickets',
              ParamType.int,
            ),
            salleref: params.getParam(
              'salleref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
            planingref: params.getParam(
              'planingref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['planning'],
            ),
          ),
        ),
        FFRoute(
          name: 'donetickets',
          path: '/donetickets',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: DoneticketsWidget(),
          ),
        ),
        FFRoute(
          name: 'ticketsCopy',
          path: '/ticketsCopy',
          builder: (context, params) => TicketsCopyWidget(
            nbroftickets: params.getParam(
              'nbroftickets',
              ParamType.int,
            ),
            salleref: params.getParam(
              'salleref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['sallle'],
            ),
            planingref: params.getParam(
              'planingref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['planning'],
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
    StructBuilder<T>? structBuilder,
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
      structBuilder: structBuilder,
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
            return '/listFilm';
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
