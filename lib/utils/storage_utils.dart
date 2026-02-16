import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtils {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  
  // Clear all secure storage data
  static Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
  
  // Clear specific keys
  static Future<void> clearAuthData() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token');
  }
  
  // Get token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token') ?? await _storage.read(key: 'token');
  }
  
  // Set token
  static Future<void> setToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }
  
  // Delete token
  static Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token');
  }
} 