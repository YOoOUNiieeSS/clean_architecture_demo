import 'package:clean_architecture/app.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/presentation/screens/qoute_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteRoute = '/favouriteRoute';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => QuoteScreen());
      case Routes.favouriteRoute:
        return MaterialPageRoute(
            builder: (context) => QuoteScreen()); //favourite route
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text(AppStrings.noRouteAvailable),
                  ),
                ));
    }
  }
}
