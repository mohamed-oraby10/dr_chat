import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:new_dr_chat_application/core/utils/assets_data.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/utils/functions/show_custom_snak_bar.dart';
import 'package:new_dr_chat_application/core/utils/routes.dart';
import 'package:new_dr_chat_application/core/widgets/custom_circular_indicator.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginWithGoogleCubit, LoginWithGoogleState>(
      listener: (context, state) {
        if (state is LoginWithGoogleSuccess) {
          GoRouter.of(context).go(AppRouter.kLoginSucceffullyView);
        } else if (state is LoginWithGoogleFailure) {
          showCustomSnakBar(context, content: state.errMessage);
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginWithGoogleLoading;
        return Center(
          child: Container(
            height: 55.h,
            width: 58.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: TextButton(
              onPressed: () {
                BlocProvider.of<LoginWithGoogleCubit>(
                  context,
                ).loginWithGoogle();
              },
              style: TextButton.styleFrom(side: BorderSide(width: .8.w)),
              child: isLoading
                  ? CustomCircularIndicator(forColor: AppColors.primaryColor)
                  : SvgPicture.asset(AssetsData.googleIcon),
            ),
          ),
        );
      },
    );
  }
}
