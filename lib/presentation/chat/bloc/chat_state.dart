part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatState extends Equatable {
  final UserModel? user;
  final List<ChatModel> chatData;
  final ChatStatus status;
  final String? errorMessage;

  const ChatState({
    this.user,
    this.chatData = const [],
    this.status = ChatStatus.initial,
    this.errorMessage,
  });

  ChatState copyWith({
    UserModel? user,
    List<ChatModel>? chatData,
    ChatStatus? status,
    String? errorMessage,
  }) {
    return ChatState(
      user: user ?? this.user,
      chatData: chatData ?? this.chatData,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [user, chatData, status, errorMessage];
}
