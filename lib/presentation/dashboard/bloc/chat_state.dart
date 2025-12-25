
part of 'chat_bloc.dart';

class ChatState extends Equatable {

  List<UserModel>? users;

  ChatState({this.users});

  ChatState copyWith({List<UserModel>? users}) {
    return ChatState(users: users ?? this.users);
  }

  @override
  List<Object?> get props => [users];
}
