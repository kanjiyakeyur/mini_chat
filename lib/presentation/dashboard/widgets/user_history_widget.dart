import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/presentation/dashboard/models/user_model.dart';
import 'package:mini_chat/presentation/dashboard/widgets/user_profile.dart';

class UserHistoryWidget extends StatelessWidget {
  UserModel user;
  UserHistoryWidget(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  children: [Text(user.name ?? ''), Text(user.lastSeen ?? '')],
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(user.lastMessage ?? '', style: TextStyle(
                           fontSize: 12.fSize,
                         ),),
                    Container(
                      width: 16.h,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade400,
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      child: Center(
                        child: Text((user.unreadMessageCount ?? 0).toString(),
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 12.fSize,
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
    );
  }
}
