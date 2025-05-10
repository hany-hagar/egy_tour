import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egy_tour/features/layout/presentation/manager/social_cubit.dart';


class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(builder: (context, state) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              backgroundColor:
              Theme.of(context).scaffoldBackgroundColor,
              radius: 75.sp,
            ),
            state is SetProfileImageLoading
                ? CircularProgressIndicator(color: Colors.blue,)
                :
            cubit.profImage.path.isEmpty
                ? CircleAvatar(
              backgroundImage: NetworkImage(
                cubit.userInfo.image,
              ),
              radius: 70.sp,
            )
                : CircleAvatar(
              backgroundImage: FileImage(cubit.profImage),
              radius: 70.sp,
            ),
          ],
        ),
      );
    },);
  }
}
