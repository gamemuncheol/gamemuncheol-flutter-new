// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  int get id => throw _privateConstructorUsedError;
  Member get member => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get timesAgo => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  List<double> get voteRatio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {int id,
      Member member,
      String videoUrl,
      String thumbnailUrl,
      String title,
      String? content,
      String? timesAgo,
      int viewCount,
      List<double> voteRatio});

  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? member = null,
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = freezed,
    Object? timesAgo = freezed,
    Object? viewCount = null,
    Object? voteRatio = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
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
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      timesAgo: freezed == timesAgo
          ? _value.timesAgo
          : timesAgo // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteRatio: null == voteRatio
          ? _value.voteRatio
          : voteRatio // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res> get member {
    return $MemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Member member,
      String videoUrl,
      String thumbnailUrl,
      String title,
      String? content,
      String? timesAgo,
      int viewCount,
      List<double> voteRatio});

  @override
  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? member = null,
    Object? videoUrl = null,
    Object? thumbnailUrl = null,
    Object? title = null,
    Object? content = freezed,
    Object? timesAgo = freezed,
    Object? viewCount = null,
    Object? voteRatio = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      member: null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member,
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
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      timesAgo: freezed == timesAgo
          ? _value.timesAgo
          : timesAgo // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      voteRatio: null == voteRatio
          ? _value._voteRatio
          : voteRatio // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.member,
      required this.videoUrl,
      required this.thumbnailUrl,
      required this.title,
      required this.content,
      required this.timesAgo,
      required this.viewCount,
      required final List<double> voteRatio})
      : _voteRatio = voteRatio;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final int id;
  @override
  final Member member;
  @override
  final String videoUrl;
  @override
  final String thumbnailUrl;
  @override
  final String title;
  @override
  final String? content;
  @override
  final String? timesAgo;
  @override
  final int viewCount;
  final List<double> _voteRatio;
  @override
  List<double> get voteRatio {
    if (_voteRatio is EqualUnmodifiableListView) return _voteRatio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_voteRatio);
  }

  @override
  String toString() {
    return 'Post(id: $id, member: $member, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl, title: $title, content: $content, timesAgo: $timesAgo, viewCount: $viewCount, voteRatio: $voteRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timesAgo, timesAgo) ||
                other.timesAgo == timesAgo) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            const DeepCollectionEquality()
                .equals(other._voteRatio, _voteRatio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      member,
      videoUrl,
      thumbnailUrl,
      title,
      content,
      timesAgo,
      viewCount,
      const DeepCollectionEquality().hash(_voteRatio));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final int id,
      required final Member member,
      required final String videoUrl,
      required final String thumbnailUrl,
      required final String title,
      required final String? content,
      required final String? timesAgo,
      required final int viewCount,
      required final List<double> voteRatio}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  int get id;
  @override
  Member get member;
  @override
  String get videoUrl;
  @override
  String get thumbnailUrl;
  @override
  String get title;
  @override
  String? get content;
  @override
  String? get timesAgo;
  @override
  int get viewCount;
  @override
  List<double> get voteRatio;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
