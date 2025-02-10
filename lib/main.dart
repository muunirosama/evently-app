import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/routes/app_routes.dart';
import 'package:evently_app/core/themes/app_themes_manager.dart';
import 'package:evently_app/modules/layout/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'core/services/loding_services.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChangeNotifierProvider(
      create: (context)=> SettingsProvider(),
      child:  const MyApp()
  )
  );
  configLoading();
}

class  MyApp extends StatelessWidget {
    const MyApp({super.key});
  // SettingsProvider provider= SettingsProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

   // var provider=Provider.of<SettingsProvider>(context);

    return Consumer<SettingsProvider>(
      builder:(context, provider, child ) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppThemesManager.lightTheme,
        darkTheme: AppThemesManager.darkTheme,
        themeMode: provider.currentTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        builder: EasyLoading.init(
            builder: BotToastInit()
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentLanguage),
      );
    }
    );
  }
}





