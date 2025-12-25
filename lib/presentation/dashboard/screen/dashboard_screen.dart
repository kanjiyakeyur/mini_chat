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

  BottomBarEnum _selectedMenu = BottomBarEnum.Home;

  final List<Widget> _pages = [
    ChatListScreen(),
    SettingScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: BottomBarEnum.values.indexOf(_selectedMenu),
          children: _pages,
        ),
      ),
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
