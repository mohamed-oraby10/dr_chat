import 'package:dr_chat/Features/Auth/presentation/views/login_successfully_view.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dr_chat/Features/Auth/presentation/views/widgets/policy_row.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          preIcon: Icon(FontAwesomeIcons.key, color: Colors.black, size: 22),
          hintText: 'Confirm Password',
          sufIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.eyeSlash,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        const RegisterPolicyRow(),
        SizedBox(height: 50.h),
        MainButton(
          text: 'Create Account',
          onTap: () {
            Navigator.push((context), MaterialPageRoute(
              builder: (context) {
                return LoginSuccessfullyView(
                  title: 'Your account successfully created!',
                  desc:
                      'Welcome to Your Virtual Psychology Assistant! Your account is created. Start your first session and take a step toward better mental health.',
                );
              },
            ))
           ;
          },
        ),
      ],
    );
  }
}
