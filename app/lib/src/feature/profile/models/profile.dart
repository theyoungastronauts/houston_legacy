import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  factory Profile({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    required String avatar,
    required String bio,
    @JsonKey(name: "created_at", includeToJson: false)
    required DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  factory Profile.empty() {
    return Profile(
      id: 0,
      uuid: '',
      avatar: "",
      bio: "",
      createdAt: DateTime.now(),
    );
  }

  bool get exists {
    return id != 0;
  }
}
