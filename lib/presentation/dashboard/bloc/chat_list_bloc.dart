import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_chat/presentation/dashboard/models/dummy_user_data.dart';
import 'package:mini_chat/data/user_model.dart';
part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListState(users: dummyUsers)) {
    on<InitEvent>(_initEvent);
    on<AddUserEvent>(_addUserEvent);
  }

  void _initEvent(InitEvent event, Emitter<ChatListState> emit) {
    emit(state.copyWith(users: dummyUsers));
  }

  void _addUserEvent(AddUserEvent event, Emitter<ChatListState> emit) {
    List<UserModel> currentUsers = List.from(state.users ?? []);
    
    var newUser = UserModel(
      id: "u_${currentUsers.length + 1}",
      name: "New User ${currentUsers.length + 1}",
      isOnline: true,
      lastSeen: DateTime.now().toString(),
      lastMessage: "Just now",
    );

    currentUsers.add(newUser);
    emit(state.copyWith(users: currentUsers));
  }
}
