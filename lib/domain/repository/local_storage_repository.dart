import 'package:weather_flutter/domain/model/user.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<String> saveToken(String token);
  Future<void> saveDarkMode(bool darkMode);
  Future<bool> isDarkMode();
}
