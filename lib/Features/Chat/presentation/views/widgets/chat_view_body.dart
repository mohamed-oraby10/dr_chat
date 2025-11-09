import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/bot_response_cubit/bot_response_cubit.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_view_app_bar.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chats_list_view.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/send_text_field.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  List<MessageModel> messages = [];

  void sendMessage(String text) {
    setState(() {
      messages.add(MessageModel(message: text, isUser: true));
    });
    BlocProvider.of<BotResponseCubit>(
      context,
    ).fetchBotResponse(userMessage: text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          ChatViewAppBar(),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocConsumer<BotResponseCubit, BotResponseState>(
              listener: (context, state) {
                if (state is BotResponseSuccess) {
                  setState(() {
                    messages.add(
                      MessageModel(
                        message: state.messageModel.message,
                        isUser: false,
                      ),
                    );
                  });
                } else if (state is BotResponseFailure) {
                  showCustomSnakBar(context, content: state.errMessage);
                }
              },
              builder: (context, state) {
                return ChatsListView(messages: messages);
              },
            ),
          ),
          SendTextField(
            onSubmitted: (value) {
              sendMessage(value);
            },
          ),
        ],
      ),
    );
  }
}
