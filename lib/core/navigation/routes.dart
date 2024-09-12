import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tcddbiletfinding/core/splass.dart';
import 'package:tcddbiletfinding/post/view/select_location_and_date.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  debugLogDiagnostics: true,
  redirect: _routeGuard,
  routes: _routes,
);

List<RouteBase> get _routes {
  return [
    GoRoute( path: '/home',
        name: 'home',
        builder: (context, state) => const TCCDListesi()),
    GoRoute( path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplassScreen()),
  ];

}
FutureOr<String?> _routeGuard(
    BuildContext context,
    GoRouterState state,
    ) async {
  const home = '/home';
  const koltuklar = '/koltuklistesi';


  return null;
}