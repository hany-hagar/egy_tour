import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/presentation/manager/chat_bot_cubit.dart';
import 'package:egy_tour/features/layout/presentation/manager/chat_bot_state.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBotCubit(),
      child: BlocBuilder<ChatBotCubit, ChatBotState>(
        builder: (context, state) {
          var cubit = ChatBotCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "AI Chat Assistant",
                style: Styles.textStyle600.copyWith(fontSize: 20.sp),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.messages.length,
                    itemBuilder: (context, index) {
                      final msg = cubit.messages[index];
                      return ListTile(
                        title: Align(
                          alignment:
                              msg.from == 'user'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color:
                                  msg.from == 'user'
                                      ? Colors.blue[200]
                                      : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              maxLines: 100,
                              msg.message.trim(),
                              style: Styles.textStyle500.copyWith(
                                fontSize: 14.sp,
                                color:
                                    msg.type == "success"
                                        ? Colors.black
                                        : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16.0,
                    end: 5.0,
                    bottom: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          height: cubit.textFormSize.toDouble(),
                          isHiddenInputBorder: true,
                          borderRadius: 10,
                          borderWidth: 1,
                          maxLines: 20,
                          controller: cubit.messageController,
                          topContentPadding: 10,
                          startContentPadding: 10,
                          endContentPadding: 5,
                          isLabelText: false,
                          isEnablePrefixIcon: false,
                          title: "How can i help you?",
                          backgroundColor:Colors.grey.shade300,
                          keyboardType: TextInputType.multiline,
                          onChanged: (p0) {
                            if (p0!.isNotEmpty) {
                              if (!cubit.showSendButton) {
                                cubit.changeSendButtonVisiablitiy(true);
                              }
                              cubit.changeTextFormSize(p0.length);
                            } else {
                              cubit.changeSendButtonVisiablitiy(false);
                            }
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.addMessage();
                          FocusScope.of(context).unfocus();
                          cubit.changeSendButtonVisiablitiy(false);
                          cubit.changeTextFormSize(0);

                        },
                        icon: Icon(
                          Icons.send,
                          color:
                              cubit.showSendButton ? Colors.blue : Colors.grey,
                          size: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
