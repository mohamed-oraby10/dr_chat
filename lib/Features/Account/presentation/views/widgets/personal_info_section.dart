import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_list_tile.dart';
import 'package:new_dr_chat_application/core/utils/constants.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(kUsers);
    var currentUser = FirebaseAuth.instance.currentUser!;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(currentUser.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'account.personal_info'.tr(),
                style: Styles.textStyle14.copyWith(fontSize: 15),
              ),
              SizedBox(height: 10.h),
              AccountListTile(
                text: snapshot.data?['name'] ?? '',
                icon: FontAwesomeIcons.solidUser,
              ),
              AccountListTile(
                text: snapshot.data?['email'] ?? '',
                icon: FontAwesomeIcons.solidEnvelope,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
