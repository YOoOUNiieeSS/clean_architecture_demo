import 'package:clean_architecture/config/routes/app_route.dart';
import 'package:clean_architecture/config/themes/app_theme.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/random_qoute/presentation/screens/qoute_screen.dart';
import 'package:flutter/material.dart';

class QouteApp extends StatelessWidget {
  const QouteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoute.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      // home: QuoteScreen(),
    );
  }
}
