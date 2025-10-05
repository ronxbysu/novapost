import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DebugUtils {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  
  // Show a dialog to clear all storage
  static Future<void> showClearStorageDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Storage'),
          content: const Text('This will clear all stored data including authentication tokens. You will need to log in again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _storage.deleteAll();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Storage cleared successfully')),
                );
              },
              child: const Text('Clear All'),
            ),
          ],
        );
      },
    );
  }
  
  // Show current storage contents (for debugging)
  static Future<void> showStorageContents(BuildContext context) async {
    final allKeys = await _storage.readAll();
    String content = 'Storage Contents:\n\n';
    allKeys.forEach((key, value) {
      content += '$key: ${value.substring(0, value.length > 50 ? 50 : value.length)}${value.length > 50 ? '...' : ''}\n';
    });
    
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Storage Contents'),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  
  // Clear only auth data
  static Future<void> clearAuthData() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token');
  }
  
  // Clear all data
  static Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
} 