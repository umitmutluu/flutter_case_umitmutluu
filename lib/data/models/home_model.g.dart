// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      bannerList: (json['bannerList'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
      combinedList: (json['combinedList'] as List<dynamic>?)
          ?.map((e) => CombinedList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'bannerList': instance.bannerList,
      'combinedList': instance.combinedList,
    };

BannerList _$BannerListFromJson(Map<String, dynamic> json) => BannerList(
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };

CombinedList _$CombinedListFromJson(Map<String, dynamic> json) => CombinedList(
      id: json['id'] as int?,
      imageUrl: json['imageUrl'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$CombinedListToJson(CombinedList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
      'name': instance.name,
      'explanation': instance.explanation,
    };
