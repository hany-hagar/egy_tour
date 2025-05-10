import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Edit%20View/edit_profile_image.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../manager/social_cubit.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [EditProfileImage(cubit: cubit)],
                ),
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
                        'Full Name',
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
                        title: 'Name',
                        keyboardType: TextInputType.text,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle600,
                      ),
                      Text(
                        'Phone Number',
                        style: Styles.textStyle800.copyWith(
                          fontSize: 18.sp,
                          height: 2.5,
                        ),
                      ),
                      CustomTextFormField(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderWidth: 1,
                        controller: cubit.phone,
                        prefixIcon: IconBroken.Call,
                        isLabelText: false,
                        title: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle600,
                      ),
                      Text(
                        'Birthday',
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
                        controller: cubit.birthday,
                        prefixIcon: IconBroken.Calendar,
                        isLabelText: false,
                        title: 'Birthday',
                        keyboardType: TextInputType.phone,
                        enableCompleteStyle: true,
                        completeStyle: Styles.textStyle400,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      state is UpdateDataLoading
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
                            child: OutlinedButton(
                              onPressed: () => cubit.updateDataOnPressed(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    IconBroken.Edit,
                                    size: 20.sp,
                                    color: Styles.defaultLinkColor,
                                  ),
                                  Text(
                                    " Update",
                                    style: Styles.textStyle500.copyWith(
                                      color: Styles.defaultLinkColor,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
