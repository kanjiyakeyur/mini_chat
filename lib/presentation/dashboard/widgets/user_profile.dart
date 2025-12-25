import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/presentation/dashboard/models/user_model.dart';

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
                ? LinearGradient(colors: [Colors.red, Colors.green])
                : null,
          ),
          child: Center(
            child: Text(
              (user.name ?? '*').substring(0, 1),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
                color: Colors.green,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
