// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CursorPagination<T> _$CursorPaginationFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _CursorPagination<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CursorPagination<T> {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get currentElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CursorPaginationCopyWith<T, CursorPagination<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorPaginationCopyWith<T, $Res> {
  factory $CursorPaginationCopyWith(
          CursorPagination<T> value, $Res Function(CursorPagination<T>) then) =
      _$CursorPaginationCopyWithImpl<T, $Res, CursorPagination<T>>;
  @useResult
  $Res call(
      {int page,
      int size,
      int currentElements,
      int totalPages,
      int totalElements,
      List<T> data});
}

/// @nodoc
class _$CursorPaginationCopyWithImpl<T, $Res, $Val extends CursorPagination<T>>
    implements $CursorPaginationCopyWith<T, $Res> {
  _$CursorPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? currentElements = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      currentElements: null == currentElements
          ? _value.currentElements
          : currentElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CursorPaginationImplCopyWith<T, $Res>
    implements $CursorPaginationCopyWith<T, $Res> {
  factory _$$CursorPaginationImplCopyWith(_$CursorPaginationImpl<T> value,
          $Res Function(_$CursorPaginationImpl<T>) then) =
      __$$CursorPaginationImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int size,
      int currentElements,
      int totalPages,
      int totalElements,
      List<T> data});
}

/// @nodoc
class __$$CursorPaginationImplCopyWithImpl<T, $Res>
    extends _$CursorPaginationCopyWithImpl<T, $Res, _$CursorPaginationImpl<T>>
    implements _$$CursorPaginationImplCopyWith<T, $Res> {
  __$$CursorPaginationImplCopyWithImpl(_$CursorPaginationImpl<T> _value,
      $Res Function(_$CursorPaginationImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? currentElements = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? data = null,
  }) {
    return _then(_$CursorPaginationImpl<T>(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      currentElements: null == currentElements
          ? _value.currentElements
          : currentElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$CursorPaginationImpl<T> implements _CursorPagination<T> {
  const _$CursorPaginationImpl(
      {required this.page,
      required this.size,
      required this.currentElements,
      required this.totalPages,
      required this.totalElements,
      required final List<T> data})
      : _data = data;

  factory _$CursorPaginationImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$CursorPaginationImplFromJson(json, fromJsonT);

  @override
  final int page;
  @override
  final int size;
  @override
  final int currentElements;
  @override
  final int totalPages;
  @override
  final int totalElements;
  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CursorPagination<$T>(page: $page, size: $size, currentElements: $currentElements, totalPages: $totalPages, totalElements: $totalElements, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursorPaginationImpl<T> &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.currentElements, currentElements) ||
                other.currentElements == currentElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, currentElements,
      totalPages, totalElements, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CursorPaginationImplCopyWith<T, _$CursorPaginationImpl<T>> get copyWith =>
      __$$CursorPaginationImplCopyWithImpl<T, _$CursorPaginationImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$CursorPaginationImplToJson<T>(this, toJsonT);
  }
}

abstract class _CursorPagination<T> implements CursorPagination<T> {
  const factory _CursorPagination(
      {required final int page,
      required final int size,
      required final int currentElements,
      required final int totalPages,
      required final int totalElements,
      required final List<T> data}) = _$CursorPaginationImpl<T>;

  factory _CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$CursorPaginationImpl<T>.fromJson;

  @override
  int get page;
  @override
  int get size;
  @override
  int get currentElements;
  @override
  int get totalPages;
  @override
  int get totalElements;
  @override
  List<T> get data;
  @override
  @JsonKey(ignore: true)
  _$$CursorPaginationImplCopyWith<T, _$CursorPaginationImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
