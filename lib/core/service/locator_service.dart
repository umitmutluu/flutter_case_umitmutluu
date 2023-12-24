import 'package:dio/dio.dart';
import 'package:flutter_case_umitmutluu/core/route/router.dart';
import 'package:flutter_case_umitmutluu/core/service/api_service.dart';
import 'package:flutter_case_umitmutluu/core/service/navigation_service.dart';
import 'package:flutter_case_umitmutluu/data/repository/home_api_repository.dart';
import 'package:flutter_case_umitmutluu/domain/interfaces/home_interface.dart';
import 'package:flutter_case_umitmutluu/domain/usecases/home_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> locatorInitialize() async {
  getIt
    ..registerLazySingleton(AppRouter.new)
    ..registerLazySingleton(() => NavigationService(getIt.get<AppRouter>()))
    ..registerLazySingletonAsync<SharedPreferences>(
      SharedPreferences.getInstance,
    );

  getIt.registerLazySingleton(() => ApiService(dio: Dio()));

  getIt.registerLazySingleton<HomeApiRepository>(
    () => HomeApiRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton(() => IHomeInterface());
  getIt.registerLazySingleton(
      () => HomeUseCase(homeInterface: getIt.get<IHomeInterface>()));
}
