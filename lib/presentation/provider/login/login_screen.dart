import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/repository/local_storage_repository.dart';
import 'package:weather_flutter/presentation/common/delivery_button.dart';
import 'package:weather_flutter/presentation/common/theme.dart';
import 'package:weather_flutter/presentation/provider/home/home_screen.dart';

import 'login_bloc.dart';

const logoSize = 45.0;

class LoginScreen extends StatelessWidget {
  LoginScreen._();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => LoginScreen._(),
    );
  }

  void login(BuildContext context) async {
    final bloc = context.read<LoginBLoC>();
    final result = await bloc.login();
    if (result) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => newMethod.init(context),
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Login incorrect'),
        ),
      );
    }
  }

  get newMethod => HomeScreen;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    final bloc = context.watch<LoginBLoC>();
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: logoSize,
                      left: -moreSize / 2,
                      right: -moreSize / 2,
                      height: width + moreSize,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.5, 1.0],
                            colors: deliveryGradients,
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor,
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/delivery/logo_delivery.png',
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Username',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).inputDecorationTheme.labelStyle.color,
                              ),
                        ),
                        TextField(
                          controller: bloc.usernameTextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              hintText: 'username'),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).inputDecorationTheme.labelStyle.color,
                              ),
                        ),
                        TextField(
                          controller: bloc.passwordTextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              hintText: 'password'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: DeliveryButton(
                  text: 'Login',
                  onTap: () => login(context),
                ),
              ),
            ],
          ),
          Positioned.fill(
              child: (bloc.loginState == LoginState.loading)
                  ? Container(
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
