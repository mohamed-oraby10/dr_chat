import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/Chat/presentation/cubits/chats_searched_results_cubit/fetch_chats_searched_results_cubit.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/history_view_app_bar.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/saved_chats_list_view.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/search_list_view.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/custom_circular_indicator.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HistoryViewAppBar(
            onChanged: (value) {
              BlocProvider.of<FetchChatsSearchedResultsCubit>(
                context,
              ).fetchChatsSearchedResults(query: value);
            },
          ),
          BlocBuilder<
            FetchChatsSearchedResultsCubit,
            FetchChatsSearchedResultsState
          >(
            builder: (context, state) {
              if (state is FetchChatsSearchedResultsLoading) {
                return Expanded(
                  child: CustomCircularIndicator(
                    forColor: AppColors.primary(context),
                  ),
                );
              } else if (state is FetchChatsSearchedResultsSuccess) {
                if (state.chats.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        'history.not_found'.tr(),
                        style: Styles.textStyle16,
                      ),
                    ),
                  );
                }
                return SearchListView(chats: state.chats);
              } else if (state is FetchChatsSearchedResultsFailure) {
                return Expanded(
                  child: Center(
                    child: Text(state.errMessage, style: Styles.textStyle16),
                  ),
                );
              }
              return Expanded(
                child: SavedChatsListView(                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
