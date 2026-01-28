import 'dart:convert';

import '../../domain/models/user_model.dart';
import '../../../../core/local_services/local_storage.dart';

class LocalAuthService {
  static const String _userKey = 'auth_user';
  static const String _isLoggedInKey = 'is_logged_in';

  final LocalStorage _localStorage;

  LocalAuthService({LocalStorage? localStorage})
    : _localStorage = localStorage ?? LocalStorage.instance;

  Future<void> saveUser(UserModel user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await _localStorage.add(_userKey, userJson);
      await _localStorage.add(_isLoggedInKey, true);
    } catch (e) {
      throw Exception('Failed to save user locally: $e');
    }
  }

  UserModel? getUser() {
    try {
      final userJson = _localStorage.get(_userKey);
      if (userJson == null) return null;

      final Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    } catch (e) {
      throw Exception('Failed to retrieve user: $e');
    }
  }

  Future<void> clearUser() async {
    try {
      await _localStorage.delete(_userKey);
      await _localStorage.delete(_isLoggedInKey);
    } catch (e) {
      throw Exception('Failed to clear user data: $e');
    }
  }

  bool isLoggedIn() {
    try {
      return _localStorage.get(_isLoggedInKey) ?? false;
    } catch (e) {
      return false;
    }
  }
}
