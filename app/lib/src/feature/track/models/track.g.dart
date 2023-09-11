// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: Album.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'album': albumToJson(instance.album),
    };
