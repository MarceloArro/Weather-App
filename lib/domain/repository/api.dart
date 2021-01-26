import 'package:weather_flutter/domain/model/product.dart';
import 'package:weather_flutter/domain/model/user.dart';
import 'package:weather_flutter/domain/request/login_request.dart';
import 'package:weather_flutter/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getCurrentCity(String token);
  Future<LoginResponse> login(LoginRequest login);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
