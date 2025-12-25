
part of 'chat_bloc.dart';

class ChatEvent {}

class InitEvent extends ChatEvent {
  UserModel? user;
  InitEvent({this.user});
}
