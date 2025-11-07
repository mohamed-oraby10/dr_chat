import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PasswordResetEmailAppBar extends StatelessWidget {
  const PasswordResetEmailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      foregroundColor: const Color(0xff5E5E5E),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(FontAwesomeIcons.xmark),
        ),
      ],
    );
  }
}
