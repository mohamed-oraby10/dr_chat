import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:new_dr_chat_application/core/utils/styles.dart';

class AnimatedTextResponse extends StatelessWidget {
  const AnimatedTextResponse({super.key, required this.botRepaly});

  final String botRepaly;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      pause: const Duration(milliseconds: 100),
      totalRepeatCount: 1,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      animatedTexts: [
        TypewriterAnimatedText(
          cursor: ' ',
          botRepaly,
          textStyle: Styles.textStyle16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
