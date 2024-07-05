// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_save_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostSaveForm _$PostSaveFormFromJson(Map<String, dynamic> json) {
  return _PostSaveForm.fromJson(json);
}

/// @nodoc
mixin _$PostSaveForm {
  String get videoUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<int> get matchUserIds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostSaveFormCopyWith<PostSaveForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostSaveFormCopyWith<$Res> {
  factory $PostSaveFormCopyWith(
          PostSaveForm value, $Res Function(PostSaveForm) then) =
      _$PostSaveFormCopyWithImpl<$Res, PostSaveForm>;
  @useResult
  $Res call(
      {String videoUrl,
      String thumbnailUrl,
      String title,
      String content,
      List<int> matchUserIds,
      List<String> tags});
}

/// @nodoc
class _$PostSaveFormCopyWithImpl<$Res, $Val extends PostSaveForm>
    implements $PostSaveFormCopyWith<$Res> {
  _$PostSaveFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = null,
    Object? matchUserIds = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      matchUserIds: null == matchUserIds
          ? _value.matchUserIds
          : matchUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostSaveFormImplCopyWith<$Res>
    implements $PostSaveFormCopyWith<$Res> {
  factory _$$PostSaveFormImplCopyWith(
          _$PostSaveFormImpl value, $Res Function(_$PostSaveFormImpl) then) =
      __$$PostSaveFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoUrl,
      String thumbnailUrl,
      String title,
      String content,
      List<int> matchUserIds,
      List<String> tags});
}

/// @nodoc
class __$$PostSaveFormImplCopyWithImpl<$Res>
    extends _$PostSaveFormCopyWithImpl<$Res, _$PostSaveFormImpl>
    implements _$$PostSaveFormImplCopyWith<$Res> {
  __$$PostSaveFormImplCopyWithImpl(
      _$PostSaveFormImpl _value, $Res Function(_$PostSaveFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = null,
    Object? matchUserIds = null,
    Object? tags = null,
  }) {
    return _then(_$PostSaveFormImpl(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      matchUserIds: null == matchUserIds
          ? _value._matchUserIds
          : matchUserIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostSaveFormImpl implements _PostSaveForm {
  const _$PostSaveFormImpl(
      {required this.videoUrl,
      required this.thumbnailUrl,
      required this.title,
      required this.content,
      required final List<int> matchUserIds,
      required final List<String> tags})
      : _matchUserIds = matchUserIds,
        _tags = tags;

  factory _$PostSaveFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostSaveFormImplFromJson(json);

  @override
  final String videoUrl;
  @override
  final String thumbnailUrl;
  @override
  final String title;
  @override
  final String content;
  final List<int> _matchUserIds;
  @override
  List<int> get matchUserIds {
    if (_matchUserIds is EqualUnmodifiableListView) return _matchUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchUserIds);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'PostSaveForm(videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, title: $title, content: $content, matchUserIds: $matchUserIds, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostSaveFormImpl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._matchUserIds, _matchUserIds) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoUrl,
      thumbnailUrl,
      title,
      content,
      const DeepCollectionEquality().hash(_matchUserIds),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostSaveFormImplCopyWith<_$PostSaveFormImpl> get copyWith =>
      __$$PostSaveFormImplCopyWithImpl<_$PostSaveFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostSaveFormImplToJson(
      this,
    );
  }
}

abstract class _PostSaveForm implements PostSaveForm {
  const factory _PostSaveForm(
      {required final String videoUrl,
      required final String thumbnailUrl,
      required final String title,
      required final String content,
      required final List<int> matchUserIds,
      required final List<String> tags}) = _$PostSaveFormImpl;

  factory _PostSaveForm.fromJson(Map<String, dynamic> json) =
      _$PostSaveFormImpl.fromJson;

  @override
  String get videoUrl;
  @override
  String get thumbnailUrl;
  @override
  String get title;
  @override
  String get content;
  @override
  List<int> get matchUserIds;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$PostSaveFormImplCopyWith<_$PostSaveFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
