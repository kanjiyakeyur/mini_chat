
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/presentation/dashboard/bloc/chat_list_bloc.dart';
import 'package:mini_chat/presentation/dashboard/widgets/user_history_widget.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatListBloc, ChatListState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.users?.length ?? 0,
          itemBuilder: (context, index) {
            final user = state.users?[index];
            return UserHistoryWidget(user!);
          },
        );
      },
    ) ;
  }
}