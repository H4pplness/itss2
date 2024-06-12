import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/share_preferences.dart';


part 'logined_user.g.dart';

@riverpod
LoginedUser loginedUser(LoginedUserRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LoginedUser(sharedPreferences);
}

class LoginedUser {
  final SharedPreferences sharedPreferences;

  LoginedUser(this.sharedPreferences);

  static const _idkey = 'loginedId';

  Future<void> setId(String id) async {
    await sharedPreferences.setString(_idkey, id);
  }

  String? getId() {
    final id = sharedPreferences.getString(_idkey);
    if (id == '' || id == null) return null;
    return id;
  }

}
