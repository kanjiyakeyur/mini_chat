
part of 'chat_list_bloc.dart';

class ChatListState extends Equatable {

  List<UserModel>? users;

  ChatListState({this.users});

  ChatListState copyWith({List<UserModel>? users}) {
    return ChatListState(users: users ?? this.users);
  }

  @override
  List<Object?> get props => [users];
}
