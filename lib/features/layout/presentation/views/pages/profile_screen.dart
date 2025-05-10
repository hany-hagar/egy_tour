import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Edit%20View/profile_view_body.dart';
import 'package:egy_tour/features/splash/presentation/views/splash_view.dart';
import '../../../../../core/utils/navigator_methods.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Fluttertoast.showToast(
            msg: "Logout Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          NavigatorMethods.pushReplacement(context: context, nextPage: SplashView());
          AppCubit.get(context).selectedIndex = 0;
        }
        if (state is LogoutFailure){
          Fluttertoast.showToast(
            msg: "Logout Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }

      },
      builder: (context, state) {
        return Scaffold(
          body: ProfileViewBody(),
        );
      },
    );
  }
}
