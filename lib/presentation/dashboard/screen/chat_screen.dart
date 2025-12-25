import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/presentation/dashboard/bloc/chat_bloc.dart';
import 'package:mini_chat/presentation/dashboard/screen/chat_history._page.dart';
import 'package:mini_chat/presentation/dashboard/screen/user_page.dart';
import 'package:mini_chat/theme/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 10.h),
          // Custom Toggle
          Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 45.h),
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: appTheme.primaryGray.withOpacity(
                0.2,
              ), // Light background for the toggle container
              borderRadius: BorderRadius.circular(25.h),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(21.h),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelColor: appTheme.black,
              unselectedLabelColor: appTheme.gray,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.fSize,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.fSize,
              ),
              tabs: [
                Tab(child: Text("Users")),
                Tab(child: Text("Chat History")),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Content
          Expanded(
            child: BlocProvider(
              create: (context) => ChatBloc()..add(InitEvent()),
              child: TabBarView(children: [UserPage(), ChatHistoryPage()]),
            ),
          ),
        ],
      ),
    );
  }
}
