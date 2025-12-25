import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/localization/app_localization.dart';
import 'package:mini_chat/localization/app_localization.dart';
import 'package:mini_chat/theme/theme_helper.dart';

enum BottomBarEnum { Home, Setting, Profile }

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({Key? key, required this.selectedType, this.onChanged})
    : super(key: key);

  final BottomBarEnum selectedType;
  final Function(BottomBarEnum)? onChanged;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      title: "lbl_setting".tr,
      type: BottomBarEnum.Setting,
    ),
    BottomMenuModel(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = bottomMenuList.indexWhere(
      (element) => element.type == selectedType,
    );
    if (selectedIndex == -1) selectedIndex = 0;

    return Container(
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.lightGray.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.h),
          topRight: Radius.circular(24.h),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12.fSize,
          unselectedFontSize: 12.fSize,
          elevation: 0,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: appTheme.iconGray,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Icon(bottomMenuList[index].icon, size: 24.h),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Icon(bottomMenuList[index].activeIcon, size: 26.h),
              ),
              label: bottomMenuList[index].title ?? "",
            );
          }),
          onTap: (index) {
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  IconData icon;

  IconData activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsetsDirectional.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
