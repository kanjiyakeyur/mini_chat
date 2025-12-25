import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/presentation/dashboard/bloc/chat_list_bloc.dart';
import 'package:mini_chat/presentation/dashboard/widgets/user_contact.dart';
import 'package:mini_chat/theme/theme_helper.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          BlocBuilder<ChatListBloc, ChatListState>(
            builder: (context, state) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.users?.length ?? 0,
                itemBuilder: (context, index) {
                  final user = state.users?[index];
                  return UserContact(user!);
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add, color: appTheme.white),
              backgroundColor: appTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
