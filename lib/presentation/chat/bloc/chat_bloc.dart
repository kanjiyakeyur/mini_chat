import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_chat/data/user_model.dart';
import 'package:mini_chat/presentation/chat/model/chat_model.dart';
import 'package:mini_chat/presentation/chat/repository/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatApiRepository _repository = ChatApiRepository();

  ChatBloc() : super(const ChatState()) {
    on<InitEvent>(_onInitEvent);
  }

  Future<void> _onInitEvent(InitEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(user: event.user, status: ChatStatus.loading));

    final result = await _repository.getChatMessages();

    result.fold(
      (error) => emit(
        state.copyWith(status: ChatStatus.failure, errorMessage: error.message),
      ),
      (response) {
        emit(
          state.copyWith(
            status: ChatStatus.success,
            chatData: response?.comments ?? [],
          ),
        );
      },
    );
  }
}
