part of 'chat_bloc.dart';

class ChatEvent {}

class InitEvent extends ChatEvent {
  UserModel? user;
  InitEvent({this.user});
}

class SendMessageEvent extends ChatEvent {
  final String message;
  SendMessageEvent({required this.message});
}
