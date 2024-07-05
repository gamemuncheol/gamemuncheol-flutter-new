import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class TokenDao {
  Future<String?> get({required String key});
  Future<void> save({required String key, required String value});
  Future<void> deleteAll();
}

@LazySingleton(as: TokenDao)
class TokenDapImpl implements TokenDao {
  final FlutterSecureStorage _secureStorage;

  TokenDapImpl({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  Future<String?> get({required String key}) async {
    print(await _secureStorage.read(key: key));
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> save({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
