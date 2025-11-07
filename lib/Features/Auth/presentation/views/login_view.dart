
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/login_with_google_cubit/login_with_google_cubit.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
  BlocProvider(create: (context)=> LoginCubit(AuthRepoImplementation())),
    BlocProvider(create: (context)=> LoginWithGoogleCubit(AuthRepoImplementation())),

],      child: const Scaffold(body: SafeArea(child: LoginViewBody())),
    );
  }
}
