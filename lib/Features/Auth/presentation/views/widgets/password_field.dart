import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
     this.obscurePassword,
    this.onChanged,
    this.onTap, this.hintText, this.obscureConfirmedPassword,
  });
  final bool? obscurePassword;
  final bool? obscureConfirmedPassword;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscurePassword ?? obscureConfirmedPassword,
      onChanged: onChanged,
      preIcon: Icon(FontAwesomeIcons.key, color: Colors.black, size: 22.sp),
      hintText: hintText  ?? 'Password',
      sufIcon: IconButton(
        onPressed: onTap,
        icon: Icon(
        obscurePassword == true || obscureConfirmedPassword==true ?
         FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
          size: 20.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
