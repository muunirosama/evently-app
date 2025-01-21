import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/themes/app_themes_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppthemesManager.lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}





