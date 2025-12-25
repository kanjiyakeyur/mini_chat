
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_chat/presentation/dashboard/models/dummy_user_data.dart';
import 'package:mini_chat/presentation/dashboard/models/user_model.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState(users: dummyUsers)) {
    on<InitEvent>(_initEvent);
  }

  void _initEvent(InitEvent event, Emitter<ChatState> emit) {
    emit(state.copyWith(users: dummyUsers));
  }

  
}