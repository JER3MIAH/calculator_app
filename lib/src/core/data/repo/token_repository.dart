import 'dart:convert';
import 'dart:developer';
import 'package:converse/src/core/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppToken {
  AppToken({
    required this.token,
    required this.user,
  });
  final String? token;
  final User? user;

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user?.toJson(),
    };
  }

  factory AppToken.fromJson(Map<String, dynamic> json) {
    return AppToken(
      token: json['token'],
      user: json['user'] == null
          ? null
          : User.fromJson(
              json['user'],
            ),
    );
  }

  AppToken copyWithToken(String? token) {
    return AppToken(
      token: token,
      user: user,
    );
  }

  AppToken copyWithUser(User? user) {
    return AppToken(
      token: token,
      user: user,
    );
  }
}

abstract class TokenRepository {
  AppToken getToken();
  Future<bool> saveToken(String token, User user);
  Future<bool> deleteToken();
  Future<bool> updateToken(AppToken token);
  Future<void> clearUser();
}

class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;
  @override
  AppToken getToken() {
    return _getTokenObjectFromStorage();
  }

  @override
  Future<bool> saveToken(String token, User user) {
    final appToken = AppToken(token: token, user: user);
    return sharedPreferences.setString(
        'token', const JsonEncoder().convert(appToken.toJson()));
  }

  AppToken _getTokenObjectFromStorage() {
    try {
      final jsonString = sharedPreferences.getString('token');
      if (jsonString == null) {
        return AppToken(token: null, user: null);
      }

      final appToken =
          AppToken.fromJson(const JsonDecoder().convert(jsonString));
      return appToken;
    } catch (err, stack) {
      log(err.toString());
      log(stack.toString());
      return AppToken(token: null, user: null);
    }
  }


  @override
  Future<bool> deleteToken() async {
    return await sharedPreferences.remove('token');
  }

  @override
  Future<bool> updateToken(AppToken token) async {
    return await sharedPreferences.setString(
        'token', const JsonEncoder().convert(token.toJson()));
  }


  @override
  Future<void> clearUser() async {
    await sharedPreferences.clear();
    await sharedPreferences.reload();
  }
}
