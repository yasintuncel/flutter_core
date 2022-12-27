import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage_keys.dart';

class SecureStorageManager {
  SecureStorageManager._privateConstructor() {
    _secureStorage = const FlutterSecureStorage();
  }
  static final SecureStorageManager instance =
      SecureStorageManager._privateConstructor();

  late final _secureStorage;

  Future<String?> readKey(SecureStorageKeys key) async {
    return await _secureStorage.read(key: key.name);
  }

  Future<void> saveKey(SecureStorageKeys key, String value) async {
    return await _secureStorage.write(key: key.name, value: value);
  }

  Future<void> removeKey(SecureStorageKeys key) async {
    return await _secureStorage.delete(key: key.name);
  }
}
