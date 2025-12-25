import 'package:flutter/material.dart';
import 'package:mini_chat/presentation/chat/model/chat_model.dart';
import 'package:mini_chat/theme/custom_text_style.dart';
import 'package:mini_chat/theme/theme_helper.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/widgets/user_profile.dart';
import 'package:mini_chat/core/size_utils.dart';

class ChatItemWidget extends StatelessWidget {
  final ChatModel chatModel;
  const ChatItemWidget({Key? key, required this.chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor = chatModel.isAuthor();

    UserModel displayUser = UserModel(
      id: chatModel.id.toString(),
      name: isAuthor ? 'Me' : 'User ${chatModel.id}',
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: isAuthor
          ? _buildAuthorMessage(context, displayUser)
          : _buildReceiverMessage(context, displayUser),
    );
  }

  Widget _buildAuthorMessage(BuildContext context, UserModel user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMessageBubble(context, isAuthor: true),
        SizedBox(width: 8.h),
        UserProfile(user),
      ],
    );
  }

  Widget _buildReceiverMessage(BuildContext context, UserModel user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfile(user, showGradient: true),
        SizedBox(width: 8.h),
        _buildMessageBubble(context, isAuthor: false),
      ],
    );
  }

  Widget _buildMessageBubble(BuildContext context, {required bool isAuthor}) {
    return Flexible(
      child: Column(
        crossAxisAlignment: isAuthor
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isAuthor ? appTheme.primary : appTheme.lightGray,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isAuthor
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                bottomRight: isAuthor
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
              ),
            ),
            child: Text(
              chatModel.body ?? '',
              style: isAuthor
                  ? CustomTextStyles.bodyMedium.copyWith(color: Colors.white)
                  : CustomTextStyles.bodyMedium,
            ),
          ),
          SizedBox(height: 4.h),
          if (chatModel.createdAt != null)
            Text(
              "${chatModel.createdAt!.hour}:${chatModel.createdAt!.minute.toString().padLeft(2, '0')}",
              style: CustomTextStyles.bodySmall,
            ),
        ],
      ),
    );
  }
}
