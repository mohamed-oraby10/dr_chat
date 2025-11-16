import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/bottom_bar_item.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({super.key});

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  late int currentIndex;

  final List<String> routes = [
    AppRouter.kChatView,
    AppRouter.kHistoryView,
    AppRouter.kAccountView,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final location = GoRouterState.of(context).uri.toString();

    setState(() {
      currentIndex = routes.indexWhere((r) => location.startsWith(r));
      if (currentIndex == -1) currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: BottomNavigationBar(
        onTap: (value) {
          if (value != currentIndex) {
            final chatId = FirebaseFirestore.instance
                .collection(kChats)
                .doc()
                .id;

            final isInChatPage = GoRouterState.of(
              context,
            ).uri.toString().startsWith(AppRouter.kChatView);

            if (isInChatPage) {
              GoRouter.of(context).push(routes[value], extra: chatId);
            } else {
              GoRouter.of(context).go(routes[value]);
            }

            setState(() => currentIndex = value);
          }
        },

        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: Styles.textStyle13,
        unselectedLabelStyle: Styles.textStyle13,
        iconSize: 21.sp,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: SvgPicture.asset(
                AssetsData.chatIcon,
                height: 25.h,
                width: 25.w,
              ),
            ),
            label: 'bottom.chat_bottom'.tr(),
          ),
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: Icon(
                currentIndex == 1
                    ? FontAwesomeIcons.solidClock
                    : FontAwesomeIcons.clock,
              ),
            ),
            label: 'bottom.history_bottom'.tr(),
          ),
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: Icon(
                currentIndex == 2
                    ? FontAwesomeIcons.solidUser
                    : FontAwesomeIcons.user,
              ),
            ),
            label: 'bottom.account_bottom'.tr(),
          ),
        ],
      ),
    );
  }
}
