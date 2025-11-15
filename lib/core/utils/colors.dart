import 'package:flutter/cupertino.dart';
import 'package:new_dr_chat_application/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

abstract class AppColors {
  static const primaryColor = Color(0xff133D38);
  static const secondColor = Color(0xff54B9A7);
  static const thirdColor = Color(0xffD6EAE3);

  static const primaryDarkColor = Color(0xff2A6563);
  static const secondDarkColor = Color(0xff499996);
  static const thirdDarkColor = Color.fromARGB(202, 52, 51, 51);

  static Color primary(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDark;
    return isDark ? primaryDarkColor : primaryColor;
  }

  static Color second(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDark;
    return isDark ? secondDarkColor : secondColor;
  }

  static Color third(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDark;
    return isDark ? thirdDarkColor : thirdColor;
  }
}
