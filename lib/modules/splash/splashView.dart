import 'dart:async';
import 'package:evently_app/modules/onBoarding/pages/on_boarding_view.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_routes_name.dart';
import '../../core/services/LocalStorageKeys.dart';
import '../../core/services/localstorage.dart';
import '../layout/layout_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Future.delayed(
    //   const Duration(seconds: 2) ,() {
    //   var  isFirstTime = LocalStorageServices.getBool(LocalStoragekey.isFirstTimeRun)??
    //       true;
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => isFirstTime?  const OnBoardingView(): const LayoutPage()
    //       )
    //   );
    // },
    // );
    Timer(
        Duration(seconds: 2),
            () {
          Navigator.pushNamedAndRemoveUntil(
              context,
              PagesRouteName.signIn,
                  (route)=>false
          );
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              const Spacer(flex: 3,),
                Center(
                  child: Image.asset(
                      AppAssets.Eventlylogo,
                    height: mediaQuery.size.height * 0.25
                  ),
                ),
              const Spacer(),
              Center(
                child: Image.asset(
                    AppAssets.group,
                    height: mediaQuery.size.height * 0.25
                ),
              )
            ],
          ),
      ),
    );
  }
}
