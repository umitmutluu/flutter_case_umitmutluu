// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter_case_umitmutluu/core/exception/error_page.dart' as _i2;
import 'package:flutter_case_umitmutluu/core/route/stacks/home_stack.dart'
    as _i4;
import 'package:flutter_case_umitmutluu/presentation/pages/basket/view/flutter_painter_image_editor.dart'
    as _i1;
import 'package:flutter_case_umitmutluu/presentation/pages/home/view/home_page.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BasketRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BasketPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ErrorPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    HomeStackRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeStackPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasketPage]
class BasketRoute extends _i5.PageRouteInfo<void> {
  const BasketRoute({List<_i5.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRoute extends _i5.PageRouteInfo<void> {
  const ErrorRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeStackPage]
class HomeStackRoute extends _i5.PageRouteInfo<void> {
  const HomeStackRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeStackRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
