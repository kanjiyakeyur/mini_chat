import 'package:flutter/material.dart';
import 'package:mini_chat/core/navigator_service.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/presentation/dashboard/widgets/user_profile.dart';
import 'package:mini_chat/routes/app_routes.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class UserHistoryWidget extends StatelessWidget {
  UserModel user;
  UserHistoryWidget(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.chatScreen, arguments: user);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          children: [
            UserProfile(user),
            SizedBox(width: 10.h),
            Expanded(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(user.name ?? '', style: CustomTextStyles.titleMedium),
                      Text(
                        user.lastSeen ?? '',
                        style: CustomTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        user.lastMessage ?? '',
                        style: CustomTextStyles.bodySmall,
                      ),
                      if (user.unreadMessageCount != null && user.unreadMessageCount! > 0)
                        Container(
                          width: 16.h,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Center(
                          child: Text(
                            user.unreadMessageCount!.toString(),
                            style: CustomTextStyles.labelLarge.copyWith(
                              fontSize: 10.fSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
