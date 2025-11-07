
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Personal info', style: Styles.textStyle14.copyWith(fontSize: 15)),
        SizedBox(height: 10.h),
        AccountListTile(text: 'mohamedoraby', icon: FontAwesomeIcons.solidUser),
        AccountListTile(
          text: 'mohamedoraby0500@gmail.com',
          icon: FontAwesomeIcons.solidEnvelope,
        ),
      ],
    );
  }
}
