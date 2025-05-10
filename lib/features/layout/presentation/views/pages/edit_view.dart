import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Edit%20View/edit_view_body.dart';
import 'package:egy_tour/features/splash/presentation/views/splash_view.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../../core/utils/styles.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SetCoverImageSuccess || state is SetProfileImageSuccess) {
          Fluttertoast.showToast(
            msg: "Image Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if (state is SetCoverImageFailure || state is SetProfileImageFailure){
          Fluttertoast.showToast(
            msg: "Image Updated Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }

        if (state is UpdateDataSuccess) {
          Fluttertoast.showToast(
            msg: "Data Updated Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          NavigatorMethods.pop(context: context);
        }
        if (state is UpdateDataFailure) {
          Fluttertoast.showToast(
            msg: "Update Data Failure",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }


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
          appBar: AppBar(
            titleSpacing: 0.0,
            leading: IconButton(
              onPressed: () => NavigatorMethods.pop(context: context),
              icon: Icon(IconBroken.Arrow___Left_2),
            ),
            title: Text(
              "Edit Profile",
              style: Styles.textStyle500.copyWith(
                fontSize: 20.sp,
                color: Styles.fontColor,
              ),
            ),
            actions: [
              state is UpdateDataLoading
                  ? Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.w),
                    child: CircularProgressIndicator(color: Colors.blue,),
                  )
                  : TextButton(
                    onPressed:
                        () => AppCubit.get(context).updateDataOnPressed(),
                    child: Text(
                      "UPDATE",
                      style: Styles.textStyle500.copyWith(
                        fontSize: 14.sp,
                        color: Styles.defaultLinkColor,
                      ),
                    ),
                  ),
              SizedBox(width: 8.w),
            ],
          ),
          body: EditViewBody(),
        );
      },
    );
  }
}
