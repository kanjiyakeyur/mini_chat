import 'package:flutter/material.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/presentation/chat/bloc/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_chat/theme/theme_helper.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/presentation/chat/widget/chat_itme_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocProvider(
      create: (context) => ChatBloc()..add(InitEvent(user: user)),
      child: Builder(builder: (context) => Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(user.name!, style: CustomTextStyles.titleMedium),
                  Text(
                    (user.isOnline ?? false)
                        ? 'Online'
                        : user.lastSeen ?? 'Offline',
                    style: CustomTextStyles.bodySmall.copyWith(
                      color: (user.isOnline ?? false)
                          ? Colors.green
                          : appTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state.status == ChatStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == ChatStatus.failure) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            } else {
              if (state.chatData.isEmpty) {
                return const Center(child: Text('No messages yet'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: state.chatData.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final reversedIndex = state.chatData.length - 1 - index;
                  return ChatItemWidget(
                    chatModel: state.chatData[reversedIndex],
                  );
                },
              );
            }
          },
        ),
        bottomNavigationBar: _buildMessageInput(context),
      ),
    ),);
  }

  Widget _buildMessageInput(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: appTheme.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: appTheme.primary,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                final message = messageController.text.trim();
                if (message.isNotEmpty) {
                  context.read<ChatBloc>().add(
                    SendMessageEvent(message: message),
                  );
                  messageController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
