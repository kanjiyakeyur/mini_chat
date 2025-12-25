import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_chat/data/user_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  ChatBloc() : super(ChatState()) {
    on<InitEvent>(_initEvent);
  }

  void _initEvent(InitEvent event, Emitter<ChatState> emit) {
    emit(state.copyWith(user: event.user));
  }
}