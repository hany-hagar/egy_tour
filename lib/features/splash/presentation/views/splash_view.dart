import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/pages/layout_screen.dart';
import 'package:egy_tour/features/login/presentation/views/sign_in_view.dart';
import '../../../../core/utils/navigator_methods.dart';
import '../../../login/presentation/manager/login_cubit.dart';
import '../../../onBoarding/presentation/views/on_boarding_view.dart';
import '../../data/repo/splash_repo.dart';
import '../../data/repo/splash_repo_impl.dart';
import '../manager/splash_view_cubit/splash_cubit.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = SplashRepoImpl();
    return BlocProvider(
      create: (context) => SplashCubit(repo as SplashRepo)..getLocation(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is AddHiveLocationSuccess) {
                NavigatorMethods.pushReplacement(
                  context: context,
                  nextPage: OnBoardingView(),
                );
              }
              if (state is UpdateHiveLocationSuccess) {
                LoginCubit.get(context).autoSignIn();
              }
            },
          ),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is AutoLoginFailure) {
                NavigatorMethods.pushReplacement(
                  context: context,
                  nextPage: SignInView(),
                );
                log("message error : ${state.error.toString()}");
              }
              if (state is AutoLoginSuccess) {
                AppCubit.get(context).userInfo = state.loginData;
                NavigatorMethods.pushReplacement(context: context, nextPage: LayoutView());
              }
            },
          ),
        ],
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return const Scaffold(body: SplashViewBody());
          },
        ),
      ),
    );
  }
}
