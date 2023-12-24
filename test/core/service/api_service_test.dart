import 'package:dio/dio.dart';
import 'package:flutter_case_umitmutluu/core/service/api_service.dart';
import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiService Tests', () {
    late ApiService apiService;
    late Dio dio;
    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'https://intertechtr.github.io'));
      apiService = ApiService(
        dio: dio,
      );
    });

    test('GET request should return a response', () async {
      final response = await apiService.get<String>('/interview.json');
      expect(response.statusCode, 200); // 200: Başarılı cevap kodu
    });
    test('GET request combinedList to a Model', () async {
      final response = await apiService.get('/interview.json');
      final homeModel = HomeModel.fromJson(response.data!);
      expect(homeModel.combinedList, isA<List>());
    });

    test('GET request bannerList to a Model', () async {
      final response = await apiService.get('/interview.json');
      final homeModel = HomeModel.fromJson(response.data!);
      expect(homeModel.bannerList, isA<List>()); // 200: Başarılı cevap kodu
    });
  });
}
