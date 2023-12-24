import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_umitmutluu/core/constants/asset_constants.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';
import 'package:flutter_case_umitmutluu/core/preferences/preferences_cubit.dart';
import 'package:flutter_case_umitmutluu/core/route/router.gr.dart';
import 'package:flutter_case_umitmutluu/core/service/locator_service.dart';
import 'package:flutter_case_umitmutluu/core/service/navigation_service.dart';
import 'package:flutter_case_umitmutluu/domain/usecases/home_usecase.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/basket/cubit/basket_cubit.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeStackPage extends StatelessWidget {
  const HomeStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(getIt<HomeUseCase>()),
        ),
        BlocProvider<BasketCubit>(
          create: (context) => BasketCubit()..getAllStorage(),
        )
      ],
      child: AutoTabsScaffold(
        backgroundColor: context.labelCross,
        appBarBuilder: (context, tabsRouter) {
          return AppBar(
            centerTitle: true,
            title: Text(tabsRouter.currentPath.getTitle(context)),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 8.sp, right: 14.sp),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () async => tappedLangButton(context, 'en'),
                        child: const Text('EN')),
                    SizedBox(
                      width: 20.sp,
                    ),
                    GestureDetector(
                        onTap: () async => tappedLangButton(context, 'tr'),
                        child: const Text('TR')),
                  ],
                ),
              )
            ],
          );
        },
        routes: const [
          HomeRoute(),
          BasketRoute(),
        ],
        navigatorObservers: () => [
          AutoRouteObserver(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              HapticFeedback.mediumImpact();
              getIt<NavigationService>().setTabsRouter(tabsRouter);
              tabsRouter.setActiveIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                label: context.translate.home,
                icon: SvgPicture.asset(AssetConstants.home),
              ),
              BottomNavigationBarItem(
                  label: context.translate.basket,
                  icon: SvgPicture.asset(AssetConstants.basket)),
            ],
          );
        },
      ),
    );
  }

  Future<void> tappedLangButton(BuildContext context, String lang) async {
    HapticFeedback.mediumImpact();
    await context.read<PreferencesCubit>().changeLocale(Locale(lang));
  }
}

extension StringX on String {
  String getTitle(BuildContext context) {
    switch (this) {
      case '/home':
        return context.translate.home;
      case '/basket':
        return context.translate.basket;
      default:
        return 'Error';
    }
  }
}
