import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class _CacheConstants {
  static String onboarding = 'onboarding';
  static String auth = 'auth';
  static String token = 'token';
  static String promoterId = 'promoterId';
  static String userHomeland = 'homeland';
  static String branchId = 'branchId';
  static String jcpId = 'jcpId';
  static String time = 'time';
  static String isRun =   'isRun';
}

class Cache {
  static late SharedPreferences _self;

  static Future<void> initialize() async {
    _self = await SharedPreferences.getInstance();
  }

  static Future<bool> setOnboarding() {
    return _self.setBool(_CacheConstants.onboarding, true);
  }

  static bool checkOnboarding() {
    try {
      return _self.getBool(_CacheConstants.onboarding)!;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> setAuth() {
    return _self.setBool(_CacheConstants.auth, true);
  }

  static bool checkAuth() {
    try {
      return _self.getBool(_CacheConstants.auth)!;
    } catch (e) {
      return false;
    }
  }


  static Future<bool> setUserToken(String token) {
    String tkn = token.substring(1, token.length - 1);
    return _self.setString(_CacheConstants.token, tkn);
  }

  static String? getUserToken() {
    try {
      return _self.getString(_CacheConstants.token);
    } catch (e) {
      return null;
    }
  }


  static Future<bool> setLocationRun(bool isRun) {
    return _self.setBool(_CacheConstants.isRun, isRun);
  }

  static bool? getLocationRun() {
    try {
      return _self.getBool(_CacheConstants.isRun);
    } catch (e) {
      return null;
    }
  }
}

// class _CacheField<T> {
//   final String _key;

//   _CacheField(this._key);

//   Future<bool> put(T value) {
//     return self.setString(_key, jsonEncode(value));
//   }

//   T? get() {
//     try {
//       return jsonDecode(self.getString(_key)!);
//     } catch (e) {
//       return null;
//     }
//   }

//   Future<bool> delete() {
//     return self.remove(_key);
//   }
// }
