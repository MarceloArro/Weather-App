import 'package:flutter/material.dart';
import 'package:weather_flutter/domain/exception/auth_exception.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/repository/local_storage_repository.dart';
import 'package:weather_flutter/domain/request/login_request.dart';

enum LoginState {
  loading,
  initial,
}

class LoginBLoC extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial;

  Future<bool> login() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await apiRepositoryInterface.login(
        LoginRequest(username, password),
      );

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);

      loginState = LoginState.initial;
      notifyListeners();
      return true;
    } on AuthException catch (_) {
      loginState = LoginState.initial;
      notifyListeners();
      return false;
    }
  }
}
