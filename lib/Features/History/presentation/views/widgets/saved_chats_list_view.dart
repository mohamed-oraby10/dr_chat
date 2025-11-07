import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/dismissible_saved_chat.dart';

class SavedChatsListView extends StatelessWidget {
  const SavedChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return DismissibleSavedChat();
        },
      ),
    );
  }
}
