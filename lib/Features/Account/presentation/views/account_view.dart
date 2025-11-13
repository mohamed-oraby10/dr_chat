import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_dr_chat_application/Features/Account/presentation/views/widgets/account_view_body.dart';
import 'package:new_dr_chat_application/Features/Auth/data/repos/auth_repo_implementation.dart';
import 'package:new_dr_chat_application/Features/Auth/presentation/cubits/logout_cubit/logout_cubit.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(AuthRepoImplementation()),
      child: const Scaffold(body: SafeArea(child: AccountViewBody())),
    );
  }
}
