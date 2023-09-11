// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../album/models/album.dart';

part 'track.freezed.dart';
part 'track.g.dart';

int albumToJson(Album album) => album.id;

@freezed
class Track with _$Track {
  const Track._();

  factory Track({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    required String title,
    required String artist,
    @JsonKey(toJson: albumToJson) required Album album,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.empty() {
    return Track(
      id: 0,
      uuid: '',
      title: "",
      artist: "",
      album: Album.empty(),
    );
  }

  bool get exists {
    return id != 0;
  }
}
