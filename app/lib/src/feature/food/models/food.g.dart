// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Food _$$_FoodFromJson(Map<String, dynamic> json) => _$_Food(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FoodToJson(_$_Food instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'profile': profileToJson(instance.profile),
    };
