import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/const/data.dart';
import 'package:egy_tour/core/utils/styles.dart';
import 'package:egy_tour/core/widgets/custom_text_form_field.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
     var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal info',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // leading:  Icon(IconBroken.Arrow___Left_2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    cubit.userInfo.image, // Replace with your image URL
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.orange,
                        ),
                      );
                    },
                  ),
                ),
              ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: defaultColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(IconBroken.Upload, color: defaultColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Upload photo',
                            style: TextStyle(
                              color: defaultColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Full name',
              style: Styles.textStyle800.copyWith(fontSize: 20.sp, height: 2),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              backgroundColor: Colors.white,
              borderWidth: 0.9,
              borderRadius: 16,
              isLabelText: false,
              isEnablePrefixIcon: false,
              title: "Full Name",
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Text(
              'Email Address',
              style: Styles.textStyle800.copyWith(fontSize: 20.sp, height: 2),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              backgroundColor: Colors.white,
              borderWidth: 0.9,
              borderRadius: 16,
              isLabelText: false,
              isEnablePrefixIcon: false,
              title: "Full Name",
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Text(
              'Birthday',
              style: Styles.textStyle800.copyWith(fontSize: 20.sp, height: 2),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              backgroundColor: Colors.white,
              borderWidth: 0.9,
              borderRadius: 16,
              isLabelText: false,
              isEnablePrefixIcon: false,
              title: "Full Name",
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Text(
              'Nationality',
              style: Styles.textStyle800.copyWith(fontSize: 20.sp, height: 2),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              backgroundColor: Colors.white,
              borderWidth: 0.9,
              borderRadius: 16,
              isLabelText: false,
              isEnablePrefixIcon: false,
              title: "Full Name",
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Text(
              'Phone number',
              style: Styles.textStyle800.copyWith(fontSize: 20.sp, height: 2),
            ),
            Row(
              children: [
                SizedBox(
                  width: 220,
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    backgroundColor: Colors.white,
                    borderWidth: 0.9,
                    borderRadius: 16,
                    isLabelText: false,
                    isEnablePrefixIcon: false,
                    title: "Full Name",
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Change',
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
