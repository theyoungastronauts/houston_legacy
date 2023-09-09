// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      year: json['year'] as int,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'year': instance.year,
      'profile': profileToJson(instance.profile),
    };
