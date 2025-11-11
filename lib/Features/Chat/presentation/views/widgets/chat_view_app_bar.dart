import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5.w)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logoImage, height: 52.h, width: 52.w),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You are chatting with', style: Styles.textStyle14),
              Text('Dr Chat', style: Styles.textStyle22),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kChatView);
            },
            icon: Icon(FontAwesomeIcons.penToSquare, size: 26.sp),
          ),
        ],
      ),
    );
  }
}
