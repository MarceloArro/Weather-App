import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import './router.dart' as route;
import 'injection/locator.dart';

void main() {
  setupLocator();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => route.Router.generateRoute(settings),
    );
  }
}
