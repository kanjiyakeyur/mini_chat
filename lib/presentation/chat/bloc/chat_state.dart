
part of 'chat_bloc.dart';

class ChatState extends Equatable {

  UserModel? user;

  ChatState({this.user});

  ChatState copyWith({UserModel? user}) {
    return ChatState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}