import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case "/":
      //  return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
    return MaterialPageRoute(settings: RouteSettings(name: routeName), builder: (_) => viewToShow);
  }
}
