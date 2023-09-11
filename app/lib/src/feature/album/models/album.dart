// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../profile/models/profile.dart';

part 'album.freezed.dart';
part 'album.g.dart';

int profileToJson(Profile profile) => profile.id;

@freezed
class Album with _$Album {
  const Album._();

  factory Album({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    required String title,
    required String description,
    required int year,
    @JsonKey(toJson: profileToJson) required Profile profile,
    @JsonKey(name: "created_at", includeToJson: false)
    required DateTime createdAt,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  factory Album.empty() {
    return Album(
      id: 0,
      uuid: '',
      title: "",
      description: "",
      year: 0,
      profile: Profile.empty(),
      createdAt: DateTime.now(),
    );
  }

  bool get exists {
    return id != 0;
  }
}
