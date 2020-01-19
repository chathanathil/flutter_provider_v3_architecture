import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_management/core/services/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  Map<String, dynamic> data = Map<String, dynamic>();

  Future<bool> login(String username, String password) async {
    data = await _api.login(username, password);
    var hasUser = data['token'] != null;
    print("service");
    if (data['token'] != null) {
      // Storing token in Shared preference
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', data['token']);
    }
    return hasUser;
  }
}
