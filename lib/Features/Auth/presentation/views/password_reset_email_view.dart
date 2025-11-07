import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/password_reset_email_view_body.dart';

class PasswordResetEmailView extends StatelessWidget {
  const PasswordResetEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PasswordResetEmailViewBody()),
    );
  }
}
