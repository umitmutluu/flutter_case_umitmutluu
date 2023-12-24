import 'package:dio/dio.dart';
import 'package:flutter_case_umitmutluu/core/service/api_service.dart';
import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';
import 'package:flutter_case_umitmutluu/domain/interfaces/home_interface.dart';

class HomeApiRepository implements IHomeInterface {
  HomeApiRepository(this.apiService);

  final ApiService apiService;

  @override
  Future<HomeEntity?> getHomeData() async {
    try {
      final res = await apiService.get<Map<String, dynamic>>(
        '/interview.json',
      );
      if (res.data != null) {
        final homeModel = HomeModel.fromJson(res.data!);
        final bannerEntity = homeModel.bannerList
            ?.map(
              (e) => BannerEntity(
                imageUrl: e.imageUrl ?? 'https://picsum.photos/id/1/200/300',
                name: e.name ?? '',
              ),
            )
            .toList();
        final combinedEntity = homeModel.combinedList
            ?.map(
              (e) => CombinedEntity(
                imageUrl: e.imageUrl ?? 'https://picsum.photos/id/1/200/300',
                explanation: e.explanation ?? '',
                type: e.type ?? '',
                name: e.name ?? '',
              ),
            )
            .toList();
        final homeEntity = HomeEntity(
          bannerEntity: bannerEntity!,
          combinedEntity: combinedEntity!,
        );

        return homeEntity;
      }
    } on DioException catch (dioError) {
      throw Exception(dioError);
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
