// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:gamemuncheol_upstream/common/service/image_picker/image_picker_service.dart'
    as _i6;
import 'package:gamemuncheol_upstream/common/service/interceptor/dio_intetceptors.dart'
    as _i8;
import 'package:gamemuncheol_upstream/core/app/auth/data/local/token_dao.dart'
    as _i7;
import 'package:gamemuncheol_upstream/core/app/auth/data/remote/auth_repository.dart'
    as _i13;
import 'package:gamemuncheol_upstream/core/app/auth/service/auth_service.dart'
    as _i16;
import 'package:gamemuncheol_upstream/core/data/local/app_db.dart' as _i19;
import 'package:gamemuncheol_upstream/core/data/remote/app_network_client.dart'
    as _i20;
import 'package:gamemuncheol_upstream/feature/board/data/remote/board_repository.dart'
    as _i10;
import 'package:gamemuncheol_upstream/feature/board/model/board_pagination_path.dart'
    as _i12;
import 'package:gamemuncheol_upstream/feature/board/service/board_service.dart'
    as _i11;
import 'package:gamemuncheol_upstream/feature/member/data/remote/member_repository.dart'
    as _i15;
import 'package:gamemuncheol_upstream/feature/member/service/member_service.dart'
    as _i18;
import 'package:gamemuncheol_upstream/feature/post/data/remote/feed_repository.dart'
    as _i14;
import 'package:gamemuncheol_upstream/feature/post/service/post_service.dart'
    as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDb = _$AppDb();
    final imagePickerModule = _$ImagePickerModule();
    final dioInterCeptors = _$DioInterCeptors();
    final appNetworkClient = _$AppNetworkClient();
    gh.lazySingleton<_i3.FlutterSecureStorage>(
        () => appDb.provideSecureStorage());
    gh.lazySingleton<_i4.ImagePicker>(() => imagePickerModule.imagePicker);
    gh.lazySingleton<_i5.PrettyDioLogger>(() => dioInterCeptors.logInterceptor);
    gh.lazySingleton<_i6.ImagePickerService>(
        () => _i6.ImagePickerService(imagePicker: gh<_i4.ImagePicker>()));
    gh.lazySingleton<_i7.TokenDao>(
        () => _i7.TokenDapImpl(secureStorage: gh<_i3.FlutterSecureStorage>()));
    gh.lazySingleton<_i8.TokenInterceptor>(
        () => dioInterCeptors.provideTokenInterceptor(gh<_i7.TokenDao>()));
    gh.lazySingleton<_i9.Dio>(() => appNetworkClient.dio(
          gh<_i5.PrettyDioLogger>(),
          gh<_i8.TokenInterceptor>(),
        ));
    gh.lazySingleton<_i10.BoardRepository>(() => _i10.BoardRepositoryImpl(
          gh<_i9.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factoryParam<_i11.BoardService, _i12.BoardPaginationPath, dynamic>((
      path,
      _,
    ) =>
        _i11.BoardService(
          path,
          boardRepository: gh<_i10.BoardRepository>(),
        ));
    gh.lazySingleton<_i13.AuthRepository>(() => _i13.AuthRepository(
          gh<_i9.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.lazySingleton<_i14.FeedRepositoryImplProxy>(
        () => _i14.FeedRepositoryImplProxy(
              gh<_i9.Dio>(),
              baseUrl: gh<String>(instanceName: 'baseUrl'),
            ));
    gh.lazySingleton<_i15.MemberRepositoryImplProxy>(
        () => _i15.MemberRepositoryImplProxy(
              gh<_i9.Dio>(),
              baseUrl: gh<String>(instanceName: 'baseUrl'),
            ));
    gh.lazySingleton<_i16.AuthService>(() => _i16.AuthService(
          tokenDao: gh<_i7.TokenDao>(),
          authRepository: gh<_i13.AuthRepository>(),
        ));
    gh.lazySingleton<_i15.MemberRepository>(() => _i15.MemberRepositoryImpl(
          dio: gh<_i9.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
          retrofit: gh<_i15.MemberRepositoryImplProxy>(),
        ));
    gh.lazySingleton<_i14.FeedRepository>(() => _i14.FeedRepositoryImpl(
          dio: gh<_i9.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
          retrofit: gh<_i14.FeedRepositoryImplProxy>(),
        ));
    gh.lazySingleton<_i17.PostService>(() => _i17.PostService(
          feedApi: gh<_i14.FeedRepository>(),
          imagePickerService: gh<_i6.ImagePickerService>(),
        ));
    gh.lazySingleton<_i18.MemberService>(() =>
        _i18.MemberService(memberRepository: gh<_i15.MemberRepository>()));
    return this;
  }
}

class _$AppDb extends _i19.AppDb {}

class _$ImagePickerModule extends _i6.ImagePickerModule {}

class _$DioInterCeptors extends _i8.DioInterCeptors {}

class _$AppNetworkClient extends _i20.AppNetworkClient {}
