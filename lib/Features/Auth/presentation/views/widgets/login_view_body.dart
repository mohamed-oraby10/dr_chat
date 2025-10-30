import 'package:dr_chat/Features/Auth/presentation/views/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ const Spacer(), const CustomContainer()]);
  }
}
