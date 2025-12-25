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
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  void _onSendMessageEvent(SendMessageEvent event, Emitter<ChatState> emit) {
    if (event.message.isEmpty) return;

    final newMessage = ChatModel(
      id:
          (state.chatData.length + 1) *
          2, // Even ID for Author (mock logic: even=author)
      body: event.message,
      createdAt: DateTime.now(),
    );

    final updatedList = List<ChatModel>.from(state.chatData)..add(newMessage);
    emit(state.copyWith(chatData: updatedList));
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
