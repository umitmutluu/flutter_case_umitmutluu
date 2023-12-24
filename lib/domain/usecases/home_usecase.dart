import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';
import 'package:flutter_case_umitmutluu/domain/interfaces/home_interface.dart';

class HomeUseCase {
  HomeUseCase({
    required this.homeInterface,
  });

  final IHomeInterface homeInterface;

  Future<HomeEntity?> getHomeDataUseCase() async {
    return homeInterface.getHomeData();
  }
}
