import 'package:flutter/material.dart';
import 'package:turf_management/core/services/authentication_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Map<String, dynamic> data = Map<String, dynamic>();

  Future<bool> login(String username, String password) async {
    setBusy(true);
    var success = await _authenticationService.login(username, password);
    data = _authenticationService.data;

    setBusy(false);
    return success;
  }
}
