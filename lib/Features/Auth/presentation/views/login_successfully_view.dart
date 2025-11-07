import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/login_successfully_body.dart';

class LoginSuccessfullyView extends StatelessWidget {
  const LoginSuccessfullyView({super.key, this.title, this.desc});
  final String? title;
  final String? desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginSuccessfullyBody(title: title, desc: desc),
      ),
    );
  }
}
