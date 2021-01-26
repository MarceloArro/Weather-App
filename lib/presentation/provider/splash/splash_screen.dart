import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/repository/local_storage_repository.dart';
import 'package:weather_flutter/presentation/common/theme.dart';
import 'package:weather_flutter/presentation/provider/home/home_screen.dart';
import 'package:weather_flutter/presentation/provider/login/login_screen.dart';
import 'package:weather_flutter/presentation/provider/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => SplashScreen._(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    final bloc = context.read<SplashBLoC>();
    final result = await bloc.validateSession();
    if (result) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen.init(context),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginScreen.init(context),
        ),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/delivery/logo_delivery.png',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: DeliveryColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
