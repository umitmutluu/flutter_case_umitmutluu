import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';
import 'package:flutter_case_umitmutluu/core/preferences/preferences_cubit.dart';
import 'package:flutter_case_umitmutluu/core/route/router.dart';
import 'package:flutter_case_umitmutluu/core/service/locator_service.dart';
import 'package:flutter_case_umitmutluu/core/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PreferencesCubit>(
          create: (context) => PreferencesCubit(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return Builder(
            builder: (context) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                locale: context
                    .select((PreferencesCubit cubit) => cubit.state.locale),
                supportedLocales: AppLocalizations.supportedLocales,
                theme: CustomThemeData(context).themeData,
                routerConfig: _router.config(),
              );
            },
          );
        },
      ),
    );
  }
}
