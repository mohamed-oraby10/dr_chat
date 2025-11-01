import 'package:dr_chat/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          preIcon: Icon(Icons.email_rounded, color: Colors.black, size: 26),
          hintText: 'E-Mail',
        ),
        SizedBox(height: 20.h),
        CustomTextFormField(
          preIcon: Icon(FontAwesomeIcons.key, color: Colors.black, size: 22),
          hintText: 'Password',
          sufIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.eyeSlash,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
