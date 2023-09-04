// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call({int id, String uuid, String title, String description, int year});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? description = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$_AlbumCopyWith(_$_Album value, $Res Function(_$_Album) then) =
      __$$_AlbumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String uuid, String title, String description, int year});
}

/// @nodoc
class __$$_AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res, _$_Album>
    implements _$$_AlbumCopyWith<$Res> {
  __$$_AlbumCopyWithImpl(_$_Album _value, $Res Function(_$_Album) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? title = null,
    Object? description = null,
    Object? year = null,
  }) {
    return _then(_$_Album(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Album extends _Album {
  _$_Album(
      {required this.id,
      required this.uuid,
      required this.title,
      required this.description,
      required this.year})
      : super._();

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String title;
  @override
  final String description;
  @override
  final int year;

  @override
  String toString() {
    return 'Album(id: $id, uuid: $uuid, title: $title, description: $description, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Album &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, title, description, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      __$$_AlbumCopyWithImpl<_$_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(
      this,
    );
  }
}

abstract class _Album extends Album {
  factory _Album(
      {required final int id,
      required final String uuid,
      required final String title,
      required final String description,
      required final int year}) = _$_Album;
  _Album._() : super._();

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get title;
  @override
  String get description;
  @override
  int get year;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumCopyWith<_$_Album> get copyWith =>
      throw _privateConstructorUsedError;
}
