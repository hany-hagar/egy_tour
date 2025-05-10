import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/login/presentation/manager/login_cubit.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/code_resset_dialog.dart';
import 'package:egy_tour/features/login/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SendMailSuccess){
          showDialog(context: context, builder: (context) => CodeResetDialog());
        }
      },
      builder: (context, state) {
        return ForgetPasswordViewBody();
      },
    );
  }
}
