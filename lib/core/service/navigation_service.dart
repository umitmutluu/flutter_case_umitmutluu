import 'package:auto_route/auto_route.dart';
import 'package:flutter_case_umitmutluu/core/route/router.dart';


class NavigationService {
  NavigationService(this._router);
  final AppRouter _router;

  late TabsRouter _tabsRouter;

  TabsRouter get getTabsRouter => _tabsRouter;
  void setTabsRouter(TabsRouter tabsRouter) {
    _tabsRouter = tabsRouter;
  }


  Future<void> pop() async {
    await _router.pop();
  }

  Future<void> navigate(PageRouteInfo routeInfo) async {
    await _router.push(routeInfo);
  }

  Future<void> navigateTo(String routeName) async {
    await _router.pushNamed(routeName);
  }

  Future<void> pushDontComeBack(PageRouteInfo routeInfo) async {
    await _router.pushAndPopUntil(routeInfo, predicate: (_) => false);
  }
}
