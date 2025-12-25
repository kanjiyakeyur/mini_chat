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
      body: BlocListener<ChatListBloc, ChatListState>(
        listenWhen: (previous, current) {
          return (current.users?.length ?? 0) > (previous.users?.length ?? 0);
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("New contact added at the end of the list"),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        child: Stack(
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
                onPressed: () {
                  context.read<ChatListBloc>().add(AddUserEvent());
                },
                child: Icon(Icons.add, color: appTheme.white),
                backgroundColor: appTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
