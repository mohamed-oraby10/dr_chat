import 'package:dr_chat/Features/Auth/presentation/views/widgets/password_reset_email_view_body.dart';
import 'package:flutter/material.dart';

class PasswordResetEmailView extends StatelessWidget {
  const PasswordResetEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PasswordResetEmailViewBody()),
    );
  }
}
