// Flutter imports:
import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/chat/screen/chat_screen.dart';
import 'package:mini_chat/presentation/dashboard/screen/dashboard_screen.dart';
import 'package:mini_chat/presentation/setting/screen/setting_screen.dart';

class AppRoutes {
  static const String dashboardScreen = '/';
  static const String settingsScreen = '/settings_screen';
  static const String chatScreen = '/chat_screen';

  static Map<String, WidgetBuilder> get routes => {
    dashboardScreen: (context) => const DashboardScreen(),
    settingsScreen: (context) => const SettingScreen(),
    chatScreen: (context) => const ChatScreen(),
  };
}
