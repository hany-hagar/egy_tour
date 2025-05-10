import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/navigator_methods.dart';
import 'package:egy_tour/features/login/presentation/manager/login_cubit.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: cubit.forgetPasswordFormKey,
            autovalidateMode: cubit.forgetPasswordAutoValidate,
            child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 600.w, // Optional: Set a max width for larger screens
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      Image.asset(
                        'assets/images/forgetPasswordIcon.png',
                        width: 200.w, // Adjust width as needed
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Forgot your password?',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 25.sp,
                          color: Styles.fontColor,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Enter your email so that we can send you password reset link',
                        style: Styles.textStyle400.copyWith(
                          fontSize: 14.sp,
                          color: Styles.fontOpacityColor,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 10),
                            child: Text(
                              'Email',
                              style: Styles.textStyle800.copyWith(
                                fontSize: 18.sp,
                                color: Styles.fontColor,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      CustomTextFormField(
                        isHiddenInputBorder: true,
                        controller: cubit.resetEmail,
                        isEnablePrefixIcon: false,
                        isLabelText: false,
                        title: 'e.g. username@kinety.com',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 24.h),
                      if (state is UpdatePasswordLoading || state is SendMailLoading)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: Styles.defaultColor),
                          ],
                        ),
                      if (state is! UpdatePasswordLoading && state is! SendMailLoading)
                        CustomButton(
                          backGroundColor: defaultColor,
                          onPressed: () => cubit.sendEmailOnPressed(),
                          text: 'Send Email',
                          isDefault: false,
                          style: Styles.textStyle800.copyWith(
                            fontSize: 18.sp,
                            letterSpacing: 1,
                          ),
                        ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () => NavigatorMethods.pop(context: context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios, size: 14.sp),
                            Text(
                              ' Back to login',
                              style: Styles.textStyle400.copyWith(
                                fontSize: 14.sp,
                                color: Styles.fontColor,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}