import 'package:shared_preferences/shared_preferences.dart';
import 'package:nti_final_project/core/utils/app_constants.dart';

class TokenStorage {
  TokenStorage._();

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyToken, token);
    await prefs.setBool(AppConstants.keyIsLoggedIn, true);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyToken);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.keyToken);
    final isLoggedIn = prefs.getBool(AppConstants.keyIsLoggedIn) ?? false;

    return isLoggedIn && token != null && token.isNotEmpty;
  }

  static Future<void> saveUserData({
    String? userId,
    String? userName,
    String? userEmail,
    String? userPhoto,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (userId != null) {
      await prefs.setString(AppConstants.keyUserId, userId);
    }

    if (userName != null) {
      await prefs.setString(AppConstants.keyUserName, userName);
    }

    if (userEmail != null) {
      await prefs.setString(AppConstants.keyUserEmail, userEmail);
    }

    if (userPhoto != null) {
      await prefs.setString(AppConstants.keyUserPhoto, userPhoto);
    }
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyUserId);
  }

  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyUserName);
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyUserEmail);
  }

  static Future<String?> getUserPhoto() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyUserPhoto);
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(AppConstants.keyToken);
    await prefs.remove(AppConstants.keyIsLoggedIn);
    await prefs.remove(AppConstants.keyUserId);
    await prefs.remove(AppConstants.keyUserName);
    await prefs.remove(AppConstants.keyUserEmail);
    await prefs.remove(AppConstants.keyUserPhoto);
  }
}