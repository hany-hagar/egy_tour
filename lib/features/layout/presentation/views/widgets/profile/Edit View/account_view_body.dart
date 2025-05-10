import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: cubit.updateFormKey,
            autovalidateMode: cubit.autoValidate,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 16,
                    bottom: 20,
                    end: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      CustomTextFormField(
                        borderWidth: 1,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        controller: cubit.userName,
                        prefixIcon: IconBroken.User,
                        isLabelText: false,
                        title: 'User Name',
                        keyboardType: TextInputType.text,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle600,
                      ),
                      Text(
                        'Nationality',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      CustomTextFormField(
                        isReadOnly: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderWidth: 1,
                        controller: cubit.country,
                        prefixIcon: IconBroken.User1,
                        isLabelText: false,
                        title: 'Nationality',
                        keyboardType: TextInputType.text,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle400,
                      ),
                      Text(
                        'Email Address',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      CustomTextFormField(
                        borderWidth: 1,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        controller: cubit.email,
                        prefixIcon: IconBroken.User,
                        isLabelText: false,
                        title: 'Email Address',
                        keyboardType: TextInputType.text,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle400,
                        isReadOnly: true,
                      ),
                      
                      Text(
                        'Password',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      CustomTextFormField(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderWidth: 1,
                        controller: cubit.password,
                        prefixIcon: IconBroken.Lock,
                        isLabelText: false,
                        title: 'Password',
                        keyboardType: TextInputType.phone,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle600,
                      ),
                      Text(
                        'New Password',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      Row(
                        children:[
                          Expanded(
                            flex: 3,
                            child: CustomTextFormField(
                                                  backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                                                  borderWidth: 1,
                                                  controller: cubit.newPassword,
                                                  prefixIcon: IconBroken.Lock,
                                                  isLabelText: false,
                                                  title: 'New Password',
                                                  keyboardType: TextInputType.phone,
                                                  enableCompleteStyle: true,
                                                  completeStyle: Styles.textStyle600,
                                                )
                          ),
                           SizedBox(width: 16.w,),  
                           state is UpdatePasswordLoading
                          ? Expanded(
                            child: Row(
                              children: [
                                Expanded(child: SizedBox()),
                                CircularProgressIndicator(
                                  color: Styles.defaultLinkColor,
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          )
                          : Expanded(
                            child: SizedBox(
                              height: 45.h,
                              child: OutlinedButton(
                                onPressed: () => cubit.changePassword(),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ), // Set border radius here
                                    ),
                                  ),
                                ),
                                child: Text(
                                      "Save",
                                      style: Styles.textStyle500.copyWith(
                                        color: Styles.defaultLinkColor,
                                        fontSize: 12.9.sp,
                                      ),
                                    ),
                              )
                            ),
                          ),                   
                        ]
                      ),
                      
                      
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                  child: Row(
                    children: [
                      state is LogoutLoading
                          ? Expanded(
                            child: Row(
                              children: [
                                Expanded(child: SizedBox()),
                                CircularProgressIndicator(
                                  color: Styles.defaultLinkColor,
                                ),
                                Expanded(child: SizedBox()),
                              ],
                            ),
                          )
                          : Expanded(
                            child: SizedBox(
                              height: 50.h,
                              child: OutlinedButton(
                                onPressed: () => cubit.logout(),
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ), // Set border radius here
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      IconBroken.Logout,
                                      size: 20.sp,
                                      color: Styles.defaultLinkColor,
                                    ),
                                    Text(
                                      " Logout",
                                      style: Styles.textStyle500.copyWith(
                                        color: Styles.defaultLinkColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                      SizedBox(width: 16),
                      SizedBox(
                        height: 50.h,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(color: Styles.defaultLinkColor),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                IconBroken.Delete,
                                size: 20.sp,
                                color: Styles.defaultLinkColor,
                              ),
                              Text(
                                " Delete Account",
                                style: Styles.textStyle500.copyWith(
                                  color: Styles.defaultLinkColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      },
    );
  }
}


