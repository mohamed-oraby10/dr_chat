
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_view_body.dart';
import 'package:new_dr_chat_application/core/widgets/buttom_navigation_bar.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: ButtomNavigationBar(),
      body:SafeArea(child: AccountViewBody()) ,
    );
  }
}