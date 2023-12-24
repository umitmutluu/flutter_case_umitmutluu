import 'package:flutter_case_umitmutluu/domain/entities/home_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeEntity copyWith Test', () {
    // Initial HomeEntity
    final homeEntity = HomeEntity(
      bannerEntity: [
        BannerEntity(imageUrl: 'banner1.jpg', name: 'Banner 1'),
        BannerEntity(imageUrl: 'banner2.jpg', name: 'Banner 2'),
      ],
      combinedEntity: [
        CombinedEntity(
          imageUrl: 'image1.jpg',
          type: 'Type 1',
          name: 'Name 1',
          explanation: 'Explanation 1',
        ),
        CombinedEntity(
          imageUrl: 'image2.jpg',
          type: 'Type 2',
          name: 'Name 2',
          explanation: 'Explanation 2',
        ),
      ],
    );

    // Use copyWith to create a new HomeEntity with modifications
    final modifiedHomeEntity = homeEntity.copyWith(
      bannerEntity: [
        BannerEntity(imageUrl: 'new_banner.jpg', name: 'New Banner'),
      ],
      combinedEntity: [
        CombinedEntity(
          imageUrl: 'new_image.jpg',
          type: 'New Type',
          name: 'New Name',
          explanation: 'New Explanation',
        ),
      ],
    );

    // Assertions to ensure copyWith worked correctly
    expect(modifiedHomeEntity.bannerEntity.length, 1);
    expect(modifiedHomeEntity.bannerEntity[0].imageUrl, 'new_banner.jpg');
    expect(modifiedHomeEntity.bannerEntity[0].name, 'New Banner');

    expect(modifiedHomeEntity.combinedEntity.length, 1);
    expect(modifiedHomeEntity.combinedEntity[0].imageUrl, 'new_image.jpg');
    expect(modifiedHomeEntity.combinedEntity[0].type, 'New Type');
    expect(modifiedHomeEntity.combinedEntity[0].name, 'New Name');
    expect(modifiedHomeEntity.combinedEntity[0].explanation, 'New Explanation');
  });

  test('CombinedEntity copyWith Test', () {
    // Initial CombinedEntity
    final combinedEntity = CombinedEntity(
      imageUrl: 'image.jpg',
      type: 'Type',
      name: 'Name',
      explanation: 'Explanation',
    );

    // Use copyWith to create a new CombinedEntity with modifications
    final modifiedCombinedEntity = combinedEntity.copyWith(
      imageUrl: 'new_image.jpg',
      type: 'New Type',
      name: 'New Name',
      explanation: 'New Explanation',
    );

    // Assertions to ensure copyWith worked correctly
    expect(modifiedCombinedEntity.imageUrl, 'new_image.jpg');
    expect(modifiedCombinedEntity.type, 'New Type');
    expect(modifiedCombinedEntity.name, 'New Name');
    expect(modifiedCombinedEntity.explanation, 'New Explanation');
  });

  test('BannerEntity copyWith Test', () {
    // Initial BannerEntity
    final bannerEntity = BannerEntity(
      imageUrl: 'image.jpg',
      name: 'Name',
    );

    // Use copyWith to create a new BannerEntity with modifications
    final modifiedBannerEntity = bannerEntity.copyWith(
      imageUrl: 'new_image.jpg',
      name: 'New Name',
    );

    // Assertions to ensure copyWith worked correctly
    expect(modifiedBannerEntity.imageUrl, 'new_image.jpg');
    expect(modifiedBannerEntity.name, 'New Name');
  });
}
