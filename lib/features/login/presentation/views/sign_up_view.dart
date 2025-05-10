import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../manager/login_cubit.dart';
import 'widgets/sign_up_view_body.dart';
import '../../../../../core/utils/navigator_methods.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          log(state.error.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarWidget.create(
              title: 'RegisterFailure',
              message: state.error.toString(),
              type: ContentType.warning,
            ),
          );
        }
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Register Success',maxLines: 2,style: Styles.textStyle700.copyWith(color: Colors.white,fontSize: 16.sp),),
                backgroundColor: CupertinoColors.activeGreen,
            ),
          );

          NavigatorMethods.pop(context: context);
        }
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
