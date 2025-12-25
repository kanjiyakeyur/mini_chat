import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_chat/core/navigator_service.dart';
import 'package:mini_chat/localization/app_localization.dart';
import 'package:mini_chat/routes/app_routes.dart';
import 'package:mini_chat/theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      navigatorKey: NavigatorService.navigatorKey,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.dashboardScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
