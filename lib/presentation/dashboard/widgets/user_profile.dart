import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  final bool showGradient;
  UserProfile(this.user, {Key? key, this.showGradient = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: showGradient ? null : Colors.lightGreen.shade400,
            gradient: showGradient
                ? LinearGradient(
                    colors: [appTheme.gradientStart, appTheme.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              (user.name ?? '*').substring(0, 1).toUpperCase(),
              style: CustomTextStyles.titleMedium.copyWith(
                color: appTheme.white,
                fontSize: 20.fSize,
              ), // Override size/color for profile
            ),
          ),
        ),

        if (user.isOnline ?? false)
          Positioned(
            bottom: 3,
            right: 3,
            child: Container(
              height: 10.h,
              width: 10.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green, // Keep logic green for online
                border: Border.all(color: appTheme.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
