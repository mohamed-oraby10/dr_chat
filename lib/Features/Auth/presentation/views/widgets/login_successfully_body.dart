import 'package:dr_chat/core/utils/assets_data.dart';
import 'package:dr_chat/core/utils/styles.dart';
import 'package:dr_chat/core/widgets/custom_clip_image.dart';
import 'package:dr_chat/core/widgets/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSuccessfullyBody extends StatelessWidget {
  const LoginSuccessfullyBody({super.key, this.title, this.desc});
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: SizedBox(
              height: 320.h,
              child: CustomClipImage(image: AssetsData.loginSuccessfully),
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            textAlign: TextAlign.center,
            title ?? 'You login successfully!',
            style: Styles.textStyle22,
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.center,
            desc ??
                'Welcome Back to Your Virtual Psychology Assistant! Continue your journey toward balance, clarity, and better mental health.',
            style: Styles.textStyle14,
          ),
          SizedBox(height: 40.h),
          MainButton(text: 'Continue', onTap: () {}),
        ],
      ),
    );
  }
}
