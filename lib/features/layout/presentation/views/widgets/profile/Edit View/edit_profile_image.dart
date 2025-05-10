
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';
import 'package:egy_tour/features/layout/presentation/views/widgets/profile/Edit%20View/profile_image.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key, required this.cubit});

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ProfileImage(cubit: cubit),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 75.sp),
            CircleAvatar(
              radius: 20.sp,
              backgroundColor: Colors.blueAccent,
              child: IconButton(
                onPressed: () => cubit.setProfImage(),
                icon: Icon(IconBroken.Camera, color: Colors.white, size: 25.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
