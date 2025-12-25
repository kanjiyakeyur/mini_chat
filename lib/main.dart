import 'package:flutter/material.dart';
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
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.dashboardScreen,
    );
  }
}
