
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';
import 'package:new_dr_chat_application/core/widgets/bottom_bar_item.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;
    return SizedBox(
      height: 65.h,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: Styles.textStyle13,
        unselectedLabelStyle: Styles.textStyle13,
        items: [
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: SvgPicture.asset(
                AssetsData.chatIcon,
                height: 27.h,
                width: 27.w,
              ),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: Icon(
                currentIndex == 1
                    ? FontAwesomeIcons.solidClock
                    : FontAwesomeIcons.clock,
              ),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: BottomBarItem(
              icon: Icon(
                currentIndex == 2
                    ? FontAwesomeIcons.solidUser
                    : FontAwesomeIcons.user,
              ),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
