import 'package:flutter/material.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/presentation/chat/bloc/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_chat/theme/theme_helper.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/presentation/chat/widget/chat_itme_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Long press or double tap a word to see its meaning"),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocProvider(
      create: (context) => ChatBloc()..add(InitEvent(user: user)),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
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
