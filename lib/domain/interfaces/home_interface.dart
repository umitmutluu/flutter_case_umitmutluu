import 'package:flutter_case_umitmutluu/core/service/locator_service.dart';
import 'package:flutter_case_umitmutluu/data/repository/home_api_repository.dart';
import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';

abstract interface class IHomeInterface {
  factory IHomeInterface() => getIt<HomeApiRepository>();

  Future<HomeEntity?> getHomeData();
}
