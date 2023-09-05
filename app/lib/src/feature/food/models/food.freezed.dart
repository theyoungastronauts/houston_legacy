// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(toJson: profileToJson)
  Profile get profile => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(includeToJson: false) String uuid,
      String name,
      @JsonKey(toJson: profileToJson) Profile profile,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? profile = null,
    Object? createdAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$_FoodCopyWith(_$_Food value, $Res Function(_$_Food) then) =
      __$$_FoodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(includeToJson: false) String uuid,
      String name,
      @JsonKey(toJson: profileToJson) Profile profile,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res, _$_Food>
    implements _$$_FoodCopyWith<$Res> {
  __$$_FoodCopyWithImpl(_$_Food _value, $Res Function(_$_Food) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? name = null,
    Object? profile = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Food(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Food extends _Food {
  _$_Food(
      {@JsonKey(includeToJson: false) required this.id,
      @JsonKey(includeToJson: false) required this.uuid,
      required this.name,
      @JsonKey(toJson: profileToJson) required this.profile,
      @JsonKey(name: "created_at", includeToJson: false)
      required this.createdAt})
      : super._();

  factory _$_Food.fromJson(Map<String, dynamic> json) => _$$_FoodFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  @JsonKey(includeToJson: false)
  final String uuid;
  @override
  final String name;
  @override
  @JsonKey(toJson: profileToJson)
  final Profile profile;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final DateTime createdAt;

  @override
  String toString() {
    return 'Food(id: $id, uuid: $uuid, name: $name, profile: $profile, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Food &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uuid, name, profile, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodCopyWith<_$_Food> get copyWith =>
      __$$_FoodCopyWithImpl<_$_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodToJson(
      this,
    );
  }
}

abstract class _Food extends Food {
  factory _Food(
      {@JsonKey(includeToJson: false) required final int id,
      @JsonKey(includeToJson: false) required final String uuid,
      required final String name,
      @JsonKey(toJson: profileToJson) required final Profile profile,
      @JsonKey(name: "created_at", includeToJson: false)
      required final DateTime createdAt}) = _$_Food;
  _Food._() : super._();

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  @JsonKey(includeToJson: false)
  String get uuid;
  @override
  String get name;
  @override
  @JsonKey(toJson: profileToJson)
  Profile get profile;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_FoodCopyWith<_$_Food> get copyWith => throw _privateConstructorUsedError;
}
