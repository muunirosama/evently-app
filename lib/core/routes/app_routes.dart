
import 'package:evently_app/core/routes/pages_routes_name.dart';
import 'package:evently_app/modules/onBoarding/on_boarding_view.dart';
import 'package:evently_app/modules/signIn/sign_in_view.dart';
import 'package:evently_app/modules/splash/splashView.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes{
  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(
            builder: (context)=> const SplashView(),
          settings: settings
        );
      case PagesRouteName.onBoarding:
        return MaterialPageRoute(
            builder: (context)=> const OnBoardingView(),
            settings: settings
        );
      case PagesRouteName.signIn:
        return MaterialPageRoute(
            builder: (context)=> const SignInView(),
            settings: settings
        );
        default:
    return MaterialPageRoute(
    builder: (context)=> const SplashView(),
    settings: settings
    );

    }
  }

}