import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/route/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  BuildContext? get context => navigatorKey.currentContext;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeStackRoute.page,
          children: [
            AutoRoute(
              initial: true,
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'basket',
              page: BasketRoute.page,
            ),
            AutoRoute(path: 'error', page: ErrorRoute.page),
          ],
        ),
      ];
}
