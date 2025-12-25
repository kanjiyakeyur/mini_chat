import 'package:flutter/material.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/presentation/chat/bloc/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_chat/theme/theme_helper.dart';
import 'package:mini_chat/theme/custom_text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return BlocProvider(
      create: (context) => ChatBloc()..add(InitEvent(user: user)),
      child: Scaffold(
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
      ),
    );
  }
}
