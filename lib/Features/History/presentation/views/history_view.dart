import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/remove_all_chats/remove_all_chats_cubit.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/delete_history_bottom_sheet.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/history_view_body.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/back_arrow_icon_button.dart';
import 'package:new_dr_chat_application/core/widgets/custom_icon_button.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveAllChatsCubit(
        getIt.get<ChatRepoImplementation>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: BackArrowIconButton(),
          elevation: 0,
          title: Text('History', style: Styles.textStyle22),
          actions: [
            CustomIconButton(image: AssetsData.searchIcon),
            CustomIconButton(
              image: AssetsData.trashIcon,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DeleteHistoryBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
        body: SafeArea(child: HistoryViewBody()),
      ),
    );
  }
}
