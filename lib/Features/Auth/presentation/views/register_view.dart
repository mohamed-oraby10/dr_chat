import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/register_view_body.dart';
import 'package:new_dr_chat_application/core/utils/colors.dart';
import 'package:new_dr_chat_application/core/widgets/custom_circular_indicator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(AuthRepoImplementation()),
        ),
        BlocProvider(
          create: (context) => LoginWithGoogleCubit(AuthRepoImplementation()),
        ),
        // BlocProvider(create: (context)=> LoginWithFacebookCubit(AuthRepoImplementation()),)
      ],
      child: BlocBuilder<LoginWithGoogleCubit, LoginWithGoogleState>(
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CustomCircularIndicator(
              forColor: AppColors.primaryColor,
            ),
            inAsyncCall: state is LoginWithGoogleLoading,
            child: Scaffold(
              appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
              body: RegisterViewBody(),
            ),
          );
        },
      ),
    );
  }
}
