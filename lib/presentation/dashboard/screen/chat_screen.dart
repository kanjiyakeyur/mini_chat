import 'package:flutter/material.dart';
import 'package:mini_chat/core/size_utils.dart';
import 'package:mini_chat/presentation/dashboard/bloc/chat_bloc.dart';
import 'package:mini_chat/presentation/dashboard/screen/chat_history._page.dart';
import 'package:mini_chat/presentation/dashboard/screen/user_page.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/theme/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 45.h),
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: appTheme.lightGray,
                    // .withOpacity(
                    //   0.8,
                    // ), // Light background for the toggle container
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
                    labelStyle: CustomTextStyles.titleSmall,
                    unselectedLabelStyle: CustomTextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: [
                      Tab(child: Text("Users")),
                      Tab(child: Text("Chat History")),
                    ],
                  ),
                ),
                centerTitle: true,
                floating: true,
                pinned: false,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 80.h,
              ),
            ];
          },
          body: BlocProvider(
            create: (context) => ChatBloc()..add(InitEvent()),
            child: TabBarView(children: [UserPage(), ChatHistoryPage()]),
          ),
        ),
      ),
    );
  }
}
