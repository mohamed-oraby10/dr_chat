import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Chat/data/repos/chat_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/remove_all_chats/remove_all_chats_cubit.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/cancel_button.dart';
import 'package:new_dr_chat_application/Features/Splash/presentation/views/widgets/custom_button.dart';
import 'package:new_dr_chat_application/core/di/service_locator.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class DeleteHistoryBottomSheet extends StatelessWidget {
  const DeleteHistoryBottomSheet({super.key, this.onTap});
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RemoveAllChatsCubit(getIt.get<ChatRepoImplementation>()),
      child: BlocConsumer<RemoveAllChatsCubit, RemoveAllChatsState>(
        listener: (context, state) {
          if (state is RemoveAllChatsFailure) {
            showCustomSnakBar(context, content: state.errMessage);
          } else if (state is RemoveAllChatsSuccess) {
            GoRouter.of(context).pop();
            showCustomSnakBar(
              context,
              content: 'history.all_chats_deleted'.tr(),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            height: MediaQuery.of(context).size.height * .25,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('history.clear_all_title'.tr(), style: Styles.textStyle22),
                SizedBox(height: 30.h),
                Text(
                  'history.clear_all_message'.tr(),
                  style: Styles.textStyle16,
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CancelButton(),
                    SizedBox(width: 16.w),
                    CustomButton(
                      text: 'history.clear_all_button'.tr(),
                      onTap: onTap,
                      // onTap: () {
                      //   BlocProvider.of<RemoveAllChatsCubit>(
                      //     context,
                      //   ).removeAllChats();
                      // },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
