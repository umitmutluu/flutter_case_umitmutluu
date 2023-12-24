import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart'
    show JsonKey, JsonSerializable;

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel with EquatableMixin {
  HomeModel({
    this.bannerList,
    this.combinedList,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  @JsonKey(name: 'bannerList')
  List<BannerList>? bannerList;
  @JsonKey(name: 'combinedList')
  List<CombinedList>? combinedList;

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  @override
  List<Object?> get props => [bannerList, combinedList];

  HomeModel copyWith({
    List<BannerList>? bannerList,
    List<CombinedList>? combinedList,
  }) {
    return HomeModel(
      bannerList: bannerList ?? this.bannerList,
      combinedList: combinedList ?? this.combinedList,
    );
  }
}

@JsonSerializable()
class BannerList with EquatableMixin {
  BannerList({
    this.imageUrl,
    this.name,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) =>
      _$BannerListFromJson(json);
  @JsonKey(name: 'imageUrl')
  String? imageUrl;
  @JsonKey(name: 'name')
  String? name;

  Map<String, dynamic> toJson() => _$BannerListToJson(this);

  @override
  List<Object?> get props => [imageUrl, name];

  BannerList copyWith({
    String? imageUrl,
    String? name,
  }) {
    return BannerList(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }
}

@JsonSerializable()
class CombinedList with EquatableMixin {
  CombinedList({
    this.id,
    this.imageUrl,
    this.type,
    this.name,
    this.explanation,
  });

  factory CombinedList.fromJson(Map<String, dynamic> json) =>
      _$CombinedListFromJson(json);
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'explanation')
  String? explanation;

  Map<String, dynamic> toJson() => _$CombinedListToJson(this);

  @override
  List<Object?> get props => [id, imageUrl, type, name, explanation];

  CombinedList copyWith({
    int? id,
    String? imageUrl,
    String? type,
    String? name,
    String? explanation,
  }) {
    return CombinedList(
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      name: name ?? this.name,
      explanation: explanation ?? this.explanation,
    );
  }
}
