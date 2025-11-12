import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Chat/data/models/chat_model.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/dismissible_saved_chat.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_circular_indicator.dart';

class SavedChatsListView extends StatelessWidget {
  const SavedChatsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(kChats)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const CustomCircularIndicator();
        }
        final docs = snapshots.data?.docs ?? [];
        if (docs.isEmpty) {
          return Center(child: Text('No chats yet', style: Styles.textStyle16));
        }
        List<ChatModel> chats = [];
        if (snapshots.hasData) {
          for (var doc in snapshots.data!.docs) {
            chats.add(ChatModel.fromJson(doc.data() as Map<String, dynamic>));
          }
        }
        final filteredChats = chats
            .where((c) => c.userId == FirebaseAuth.instance.currentUser!.uid)
            .toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: filteredChats.length,
          itemBuilder: (context, index) {
            var chat = filteredChats[index];
            return DismissibleSavedChat(
              chat: chat,
              onDelete: (direction) async {
                await FirebaseFirestore.instance
                    .collection(kChats)
                    .doc(chat.chatId)
                    .delete();
                showCustomSnakBar(
                  context,
                  content: 'Chat deleted successfully',
                );
              },
            );
          },
        );
      },
    );
  }
}
