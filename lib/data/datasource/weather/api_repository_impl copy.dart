import 'package:weather_flutter/domain/exception/auth_exception.dart';
import 'package:weather_flutter/domain/model/product.dart';
import 'package:weather_flutter/domain/model/user.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/request/login_request.dart';
import 'package:weather_flutter/domain/response/login_response.dart';

import '../../in_memory_products.dart';

/// implementaciones que van en injector de depencias como provider o getit, por lo cual
/// utilizar get it con injectable en los datasourcey separarlos tal vez por tipo de servicio
class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return const User(
        name: 'Steve Jobs',
        username: 'stevejobs',
        image: 'assets/delivery/users/stevejobs.jpg',
      );
    } else if (token == 'AA222') {
      return const User(
        name: 'Elon Musk',
        username: 'elonmusk',
        image: 'assets/delivery/users/elonmusk.jpg',
      );
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(const Duration(seconds: 3));
    if (login.username == 'steve' && login.password == 'jobs') {
      return LoginResponse(
        'AA111',
        User(
          name: 'Steve Jobs',
          username: 'stevejobs',
          image: 'assets/delivery/users/stevejobs.jpg',
        ),
      );
    }
    if (login.username == 'elon' && login.password == 'musk') {
      return LoginResponse(
        'AA222',
        User(
          name: 'Elon Musk',
          username: 'elonmusk',
          image: 'assets/delivery/users/elonmusk.jpg',
        ),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server :$token');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
