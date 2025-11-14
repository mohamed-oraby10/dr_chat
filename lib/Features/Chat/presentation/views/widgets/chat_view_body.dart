import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/message_model.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/bot_response_cubit/bot_response_cubit.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chat_view_app_bar.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/chats_list_view.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/send_text_field.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/views/widgets/unsaved_chats_list_view.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';

class ChatViewBody extends StatefulWidget {
  final String chatId;
  const ChatViewBody({super.key, required this.chatId});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(microseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
                  if (!isLoggedIn) {
                    setState(() {
                      messages.add(
                        MessageModel(
                          message: state.messageModel.message,
                          isUser: false,
                        ),
                      );
                    });
                  }
                  scrollToBottom();
                } else if (state is BotResponseFailure) {
                  showCustomSnakBar(context, content: state.errMessage);
                }
              },
              builder: (context, state) {
                if (!isLoggedIn) {
                  return UnsavedChatsListView(
                    messages: messages,
                    scrollController: scrollController,
                  );
                }
                return ChatsListView(
                  chatId: widget.chatId,
                  controller: scrollController,
                );
              },
            ),
          ),
          SendTextField(
            onSubmitted: (value) async {
              if (!isLoggedIn) {
                setState(() {
                  messages.add(MessageModel(message: value, isUser: true));
                });
              }
              await BlocProvider.of<BotResponseCubit>(
                context,
              ).sendMessage(context, value, widget.chatId);
              scrollToBottom();
            },
          ),
        ],
      ),
    );
  }
}
