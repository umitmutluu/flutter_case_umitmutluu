import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_umitmutluu/core/exception/error_page.dart';
import 'package:flutter_case_umitmutluu/core/exception/widget_not_found_exception.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_case_umitmutluu/core/preferences/preferences_cubit.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/widget/selected_check_button.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/widget/shimmer_effect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'home_page_extension.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: context.read<HomeCubit>()..getHomeModels(),
        builder: (context, state) {
          return BlocBuilder<PreferencesCubit, PreferencesState>(
            builder: (context, langState) {
              return buildBody(state, context);
            },
          );
        },
      ),
    );
  }

  Widget buildBody(HomeState state, context) {
    if (state.status == HomeStatus.loading) {
      return const ShimmerEffect();
    } else if (state.status == HomeStatus.error) {
      return const Center(child: ErrorPage());
    } else if (state.status == HomeStatus.success) {
      return state.buildSuccessPage();
    }
    throw WidgetNotFoundException<HomePage, HomeState>(state);
  }


}
