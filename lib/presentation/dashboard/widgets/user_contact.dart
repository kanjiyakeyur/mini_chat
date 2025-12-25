import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/presentation/dashboard/models/user_model.dart';
import 'package:mini_chat/presentation/dashboard/widgets/user_profile.dart';
import 'package:mini_chat/theme/custom_text_style.dart';

class UserContact extends StatelessWidget {
  UserModel user;
  UserContact(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        children: [
          UserProfile(user, showGradient: true),
          SizedBox(width: 10.h),
          Expanded(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text(user.name ?? '', style: CustomTextStyles.titleMedium),
                Text(
                  user.isOnline ?? false
                      ? 'Online'
                      : user.lastSeen ?? 'Offline',
                  style: CustomTextStyles.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
