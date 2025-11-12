import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/app_bar_actions.dart';
import 'package:new_dr_chat_application/Features/History/presentation/views/widgets/search_text_feild.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/back_arrow_icon_button.dart';

class HistoryViewAppBar extends StatefulWidget {
  const HistoryViewAppBar({super.key});

  @override
  State<HistoryViewAppBar> createState() => _HistoryViewAppBarState();
}

class _HistoryViewAppBarState extends State<HistoryViewAppBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          BackArrowIconButton(),
          SizedBox(width: 10.w),
          isSearch
              ? SearchTextFeild()
              : Text('History', style: Styles.textStyle22),
          Spacer(),
          AppBarActions(
            isSearch: isSearch,
            onPress: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
          ),
        ],
      ),
    );
  }
}
