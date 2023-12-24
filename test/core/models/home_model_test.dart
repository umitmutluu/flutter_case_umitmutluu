import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeModel', () {
    group('copyWith', () {
      test(
        'should return the same object if copyWith is called without parameters',
            () {
          // ARRANGE
          final homeModel = HomeModel(
            bannerList: [BannerList(imageUrl: 'url', name: 'banner')],
            combinedList: [CombinedList(id: 1, imageUrl: 'url', type: 'type', name: 'name', explanation: 'explanation')],
          );

          // ACT
          final newHomeModel = homeModel.copyWith();

          // ASSERT
          expect(newHomeModel, equals(homeModel));
        },
      );

      test(
        'should return correct object when only bannerList is changed by copyWith',
            () {
          // ARRANGE
          final homeModel = HomeModel(
            bannerList: [BannerList(imageUrl: 'url', name: 'banner')],
            combinedList: [CombinedList(id: 1, imageUrl: 'url', type: 'type', name: 'name', explanation: 'explanation')],
          );

          final newBannerList = [BannerList(imageUrl: 'new_url', name: 'new_banner')];

          final expected = HomeModel(
            bannerList: newBannerList,
            combinedList: homeModel.combinedList,
          );

          // ACT
          final newHomeModel = homeModel.copyWith(bannerList: newBannerList);

          // ASSERT
          expect(newHomeModel, equals(expected));
        },
      );

      test(
        'should return correct object when only combinedList is changed by copyWith',
            () {
          // ARRANGE
          final homeModel = HomeModel(
            bannerList: [BannerList(imageUrl: 'url', name: 'banner')],
            combinedList: [CombinedList(id: 1, imageUrl: 'url', type: 'type', name: 'name', explanation: 'explanation')],
          );

          final newCombinedList = [CombinedList(id: 2, imageUrl: 'new_url', type: 'new_type', name: 'new_name', explanation: 'new_explanation')];

          final expected = HomeModel(
            bannerList: homeModel.bannerList,
            combinedList: newCombinedList,
          );

          // ACT
          final newHomeModel = homeModel.copyWith(combinedList: newCombinedList);

          // ASSERT
          expect(newHomeModel, equals(expected));
        },
      );
    });
  });

  group('BannerList', () {
    group('copyWith', () {
      test(
        'should return the same object if copyWith is called without parameters',
            () {
          // ARRANGE
          final bannerList = BannerList(imageUrl: 'url', name: 'banner');

          // ACT
          final newBannerList = bannerList.copyWith();

          // ASSERT
          expect(newBannerList, equals(bannerList));
        },
      );

      test(
        'should return correct object when only imageUrl is changed by copyWith',
            () {
          // ARRANGE
          final bannerList = BannerList(imageUrl: 'url', name: 'banner');
          const newImageUrl = 'new_url';
          final expected = BannerList(imageUrl: newImageUrl, name: bannerList.name);

          // ACT
          final newBannerList = bannerList.copyWith(imageUrl: newImageUrl);

          // ASSERT
          expect(newBannerList, equals(expected));
        },
      );

      test(
        'should return correct object when only name is changed by copyWith',
            () {
          // ARRANGE
          final bannerList = BannerList(imageUrl: 'url', name: 'banner');
          const newName = 'new_banner';
          final expected = BannerList(imageUrl: bannerList.imageUrl, name: newName);

          // ACT
          final newBannerList = bannerList.copyWith(name: newName);

          // ASSERT
          expect(newBannerList, equals(expected));
        },
      );
    });
  });

  group('CombinedList', () {
    group('copyWith', () {

      test(
        'should return correct object when only imageUrl is changed by copyWith',
            () {
          // ARRANGE
          final combinedList = CombinedList( imageUrl: 'url', type: 'type', name: 'name', explanation: 'explanation');
          const newImageUrl = 'new_url';
          final expected = CombinedList( imageUrl: newImageUrl, type: combinedList.type, name: combinedList.name, explanation: combinedList.explanation);

          // ACT
          final newCombinedList = combinedList.copyWith(imageUrl: newImageUrl);

          // ASSERT
          expect(newCombinedList, equals(expected));
        },
      );

      test(
        'should return correct object when only type is changed by copyWith',
            () {
          // ARRANGE
          final combinedList = CombinedList( imageUrl: 'url', type: 'type', name: 'name', explanation: 'explanation');
          const newType = 'new_type';
          final expected = CombinedList( imageUrl: combinedList.imageUrl, type: newType, name: combinedList.name, explanation: combinedList.explanation);

          // ACT
          final newCombinedList = combinedList.copyWith(type: newType);

          // ASSERT
          expect(newCombinedList, equals(expected));
        },
      );

      test(
        'should return correct object when only name is changed by copyWith',
            () {
          // ARRANGE
          final combinedList = CombinedList( imageUrl: 'url4', type: 'type4', name: 'name4', explanation: 'explanation4');
          const newName = 'new_name';
          final expected = CombinedList( imageUrl: combinedList.imageUrl, type: combinedList.type, name: newName, explanation: combinedList.explanation);

          // ACT
          final newCombinedList = combinedList.copyWith(name: newName);

          // ASSERT
          expect(newCombinedList, equals(expected));
        },
      );

      test(
          'should return correct object when only explanation is changed by copyWith',
      () {
        // ARRANGE
        final combinedList = CombinedList(imageUrl: 'url1', type: 'type2', name: 'name3', explanation: 'explanation4');
        const newExplanation = 'new_explanation';
        final expected = CombinedList( imageUrl: combinedList.imageUrl, type: combinedList.type, name: combinedList.name, explanation: newExplanation);

        // ACT
        final newCombinedList = combinedList.copyWith(explanation: newExplanation);

        // ASSERT
        expect(newCombinedList, equals(expected));
      },
      );

      test(
        'should return correct object when all parameters are changed by copyWith',
            () {
          // ARRANGE
          final combinedList = CombinedList(imageUrl: 'url2', type: 'type3', name: 'name4', explanation: 'explanation');
          const newImageUrl = 'new_url';
          const newType = 'new_type';
          const newName = 'new_name';
          const newExplanation = 'new_explanation';
          final expected = CombinedList( imageUrl: newImageUrl, type: newType, name: newName, explanation: newExplanation);

          // ACT
          final newCombinedList = combinedList.copyWith(
            imageUrl: newImageUrl,
            type: newType,
            name: newName,
            explanation: newExplanation,
          );

          // ASSERT
          expect(newCombinedList, equals(expected));
        },
      );
    });
  });
}
