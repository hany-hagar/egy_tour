
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/layout/data/models/msg_model.dart';
import 'package:egy_tour/features/layout/data/repositories/social_repo_impl.dart';
import 'package:egy_tour/features/layout/presentation/manager/chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatInitial());
  static ChatBotCubit get(context) => BlocProvider.of<ChatBotCubit>(context);

  List<MsgModel> messages = [];
  var messageController = TextEditingController();
  var showSendButton = false;
  var textFormSize = 50;


  void changeSendButtonVisiablitiy(bool data){
   showSendButton = data;
   emit(SendButtonVisiablitiy());
    
  }

void changeTextFormSize(int num) {
  if (num < 31) {
    textFormSize = 45;
  } else if (num < 60) {
    textFormSize = 80;
  } else {
    textFormSize = 120;
  }
  emit(ChangeTextFormSize());
}

  
  Future<void> addMessage() async {
    MsgModel message = MsgModel(message: messageController.text, from: "user",type: "success");
    messages.add(message);
    messageController.clear();
    await getMessage(message.message);

  }
  Future<void> getMessage(message) async {
    emit(ChatLoading());
    var data = await SocialRepoImpl().chatBotMessage(message: message);
    data.fold(
      (l) {
        emit(ChatFailure());
        var message = MsgModel(message: l.errMessage.toString(), from: "Robot",type: "failed");
        messages.add(message);
      }
      , 
      (r) {
        emit(ChatSuccess());
        var message = MsgModel(message: r.toString(), from: "Robot",type: "success");
        messages.add(message);
      },
      );
  }
  
}
