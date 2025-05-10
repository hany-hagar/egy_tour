import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/layout_screen.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../core/utils/styles.dart';
import '../manager/login_cubit.dart';
import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login Success',
                maxLines: 2,
                style: Styles.textStyle700.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              backgroundColor: CupertinoColors.activeGreen,
            ),
          );
          AppCubit.get(context).userInfo = state.loginData;
          appCubit.favCar = state.loginData.favouriteCars;
          appCubit.favHotel = state.loginData.favouriteHotels;
          appCubit.favTour = state.loginData.favouriteTours;
          appCubit.favTourism = state.loginData.favouritesTourisms;
          NavigatorMethods.pushReplacement(
            context: context,
            nextPage: LayoutView(),
          );
        }
        if (state is LoginFailure) {
          log(state.error.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error.toString(),
                maxLines: 2,
                style: Styles.textStyle700.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              backgroundColor: CupertinoColors.destructiveRed,
            ),
          );
        }
      },
      builder: (context, state) {
        return SignInViewBody();
      },
    );
  }
}
