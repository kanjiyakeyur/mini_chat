import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/dashboard/screen/chat_list_screen.dart';
import 'package:mini_chat/widgets/custom_bottom_bar.dart';

import 'package:mini_chat/presentation/setting/screen/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Widget _getCurrentPage(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return ChatListScreen(); // Placeholder for now or actual content
      case BottomBarEnum.Setting:
        return const SettingScreen();
      case BottomBarEnum.Profile:
        return const SettingScreen();
    }
  }

  BottomBarEnum _selectedMenu = BottomBarEnum.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getCurrentPage(_selectedMenu)),
      bottomNavigationBar: CustomBottomBar(
        selectedType: _selectedMenu,
        onChanged: (BottomBarEnum type) {
          setState(() {
            _selectedMenu = type;
          });
        },
      ),
    );
  }
}
