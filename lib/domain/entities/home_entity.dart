import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  const HomeEntity({
    required this.bannerEntity,
    required this.combinedEntity,
  });

  final List<BannerEntity> bannerEntity;
  final List<CombinedEntity> combinedEntity;

  @override
  List<Object?> get props => [
        bannerEntity,
        combinedEntity,
      ];

  HomeEntity copyWith({
    List<BannerEntity>? bannerEntity,
    List<CombinedEntity>? combinedEntity,
  }) {
    return HomeEntity(
      bannerEntity: bannerEntity ?? this.bannerEntity,
      combinedEntity: combinedEntity ?? this.combinedEntity,
    );
  }
}

class CombinedEntity with EquatableMixin {
  CombinedEntity({
    required this.imageUrl,
    required this.type,
    required this.name,
    required this.explanation,
  });

  final String imageUrl;
  final String type;
  final String name;
  final String explanation;

  @override
  List<Object?> get props => [
        imageUrl,
        type,
        name,
        explanation,
      ];
  CombinedEntity copyWith({
    int? id,
    String? imageUrl,
    String? type,
    String? name,
    String? explanation,
  }) {
    return CombinedEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      name: name ?? this.name,
      explanation: explanation ?? this.explanation,
    );
  }
}

class BannerEntity with EquatableMixin {
  BannerEntity({
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  List<Object?> get props => [imageUrl, name];

  BannerEntity copyWith({
    String? imageUrl,
    String? name,
  }) {
    return BannerEntity(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }
}
