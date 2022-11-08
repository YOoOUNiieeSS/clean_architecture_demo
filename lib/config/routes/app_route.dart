import 'package:clean_architecture/app.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/features/random_qoute/presentation/screens/qoute_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteRoute = '/favouriteRoute';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: QuoteScreen(),
                )); 
      case Routes.favouriteRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: QuoteScreen(),
                )); //favourite route
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
