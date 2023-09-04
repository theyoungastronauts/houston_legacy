import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const Album._();

  factory Album({
    required int id,
    required String uuid,
    required String title,
    required String description,
    required int year,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  factory Album.empty() {
    return Album(
      id: 0,
      uuid: '',
      title: "",
      description: "",
      year: 0,
    );
  }

  bool get exists {
    return id != 0;
  }
}
