
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_facebook_cubit/login_with_facebook_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> RegisterCubit(AuthRepoImplementation()),),
          BlocProvider(create: (context)=> LoginWithGoogleCubit(AuthRepoImplementation()),),
          BlocProvider(create: (context)=> LoginWithFacebookCubit(AuthRepoImplementation()),)
      ],
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: RegisterViewBody(),
      ),
    );
  }
}
